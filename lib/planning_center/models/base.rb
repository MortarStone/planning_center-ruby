# frozen_string_literal: true

module PlanningCenter
  class Base
    include ActiveModel::Attributes
    include ActiveModel::Dirty
    include ActiveModel::Model

    extend Enumerable

    attr_accessor :persisted, :client

    attribute_method_suffix '?'

    def attribute?(attr)
      public_send(attr).present?
    end

    define_model_callbacks :update, :save

    after_save :persist!

    delegate :base_endpoint, :format_response, to: :class

    def initialize(attributes = nil, client: nil)
      super()

      @persisted = false
      assign_attributes(attributes) if attributes
      @client = client
      yield self if block_given?
    end

    class << self
      def page_size
        100
      end

      def all(client: nil)
        paginated_requests(client: client)
      end

      def paginated_requests(client: nil, params: {})
        client ||= PlanningCenter.configuration.client

        offset = 0
        results = []
        loop do
          response = client.get(
            base_endpoint,
            params.merge(offset: offset, per_page: page_size)
          )
          break if response.empty? || response['data'].empty?

          response['data'].map do |hsh|
            attrs = format_response(hsh)
            results << new(attrs, client: client, &:persist!)
          end

          offset += page_size
          break if response['data'].count < page_size
        end
        results
      end

      def where(client: nil, **params)
        paginated_requests(
          client: client,
          params: format_parameters(params)
        )
      end

      def format_parameters(args)
        extra_keys = args.keys - self::QUERIABLE_FIELDS
        if extra_keys.present?
          raise PlanningCenter::Exceptions::BadRequest,
                bad_request_message(extra_keys)
        end

        args.transform_keys { |k| "where[#{k}]" }
      end

      def bad_request_message(keys)
        str = keys.map { |k| "'#{k}'" }.join(', ')
        if keys.count > 1
          "#{str} are not valid inputs"
        else
          "#{str} is not a valid input"
        end
      end

      def find(id, client: nil)
        client ||= PlanningCenter.configuration.client

        response = client.get("#{base_endpoint}/#{id}")['data']
        attrs = format_response(response)

        new attrs, client: client, &:persist!
      end

      def create(client: nil, **attributes, &block)
        if attributes.is_a? Array
          attributes.collect { |attr| create attr, client: client, &block }
        else
          client ||= PlanningCenter.configuration.client

          object = new attributes, client: client
          yield object if block_given?
          object.save
          object
        end
      end

      def update(id, client: nil, **attributes)
        client ||= PlanningCenter.configuration.client

        object = find(id, client: client)
        object.update(attributes)
        object
      end

      def find_or_create_by(client: nil, **attributes, &block)
        find_by(client: client, **attributes) ||
          create(client: client, **attributes, &block)
      end

      def find_by(client: nil, **args)
        where(client: client, **args)&.first
      end

      def each(client: nil, &block)
        all(client: client).each(&block)
      end

      def format_response(response)
        hsh = response['attributes'].merge(id: response['id'])

        response['relationships']&.each do |_k, v|
          attr = "#{v.dig('data', 'type')&.underscore}_id"
          hsh[attr] = v.dig('data', 'id') if attribute_names.include? attr
        end
        hsh
      end
    end

    def update(attributes)
      run_callbacks :update do
        assign_attributes(attributes)
        save
      end
    end

    def delete
      client.delete(endpoint)

      @persisted = false

      self
    end

    alias destroy delete

    def save
      run_callbacks :save do
        return false unless valid?

        body = format_body(attributes)

        response =
          if persisted?
            client.patch(endpoint, body)
          else
            client.post(endpoint, body)
          end

        assign_attributes(format_response(response['data']))

        true
      end
    end

    def format_body(attributes = {})
      {
        data: {
          type: model_name.element.camelize,
          attributes: attribute_fields(attributes)
        }
      }
    end

    def attribute_fields(attributes = {})
      attributes.select { |k| field_list.include?(k.to_sym) }
    end

    def field_list
      persisted? ? self.class::UPDATABLE_FIELDS : self.class::CREATABLE_FIELDS
    end

    def persisted?
      @persisted
    end

    def persist!
      changes_applied
      @persisted = true
    end

    def attributes
      super.symbolize_keys
    end

    def endpoint
      persisted? ? "#{base_endpoint}/#{id}" : base_endpoint
    end
  end
end
