module PlanningCenter
  class Base
    include ActiveModel::Attributes
    include ActiveModel::Dirty
    include ActiveModel::Model

    extend Enumerable

    class_attribute :client

    attr_accessor :persisted

    attribute_method_suffix '?'

    def attribute?(attr)
      public_send(attr).present?
    end

    define_model_callbacks :update, :save

    after_save :persist!

    delegate :base_endpoint, :format_response, to: :class

    def initialize(attributes = nil)
      super()

      @persisted = false
      assign_attributes(attributes) if attributes
      yield self if block_given?

      self
    end

    class << self
      def client
        @client ||= PlanningCenter::Client.new(
          access_token: PlanningCenter.configuration.access_token
        )
      end

      def where(params = {})
        params = { where: params }
        response = client.get(base_endpoint, params).dig('data')

        response.map do |hsh|
          attrs = format_response(hsh)
          new attrs, &:persist!
        end
      end

      def find(id)
        return if id.nil?

        response = client.get("#{base_endpoint}/#{id}").dig('data')
        attrs = format_response(response)

        new attrs, &:persist!
      end

      def create(attributes = nil, &block)
        if attributes.is_a? Array
          attributes.collect { |attr| create attr, &block }
        else
          object = new attributes
          yield object if block_given?
          object.save
          object
        end
      end

      def update(id, attributes)
        object = find(id)
        object.update(attributes)
        object
      end

      def all
        response = client.get(base_endpoint).dig('data')

        response.map do |hsh|
          attrs = format_response(hsh)
          new attrs, &:persist!
        end
      end

      def each
        all.each { |obj| yield obj }
      end

      def base_endpoint
        "people/v2/#{model_name.element.pluralize}"
      end

      def format_response(response)
        hsh = response.dig('attributes').merge(id: response.dig('id'))

        response.dig('relationships')&.each do |k, v|
          attr = "#{v.dig('data', 'type')&.underscore}_id"

          if attribute_names.include? attr
            hsh[attr] = v.dig('data', 'id')
          end
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

        body = format_body(attributes.slice(*self.class::FIELDS))

        if persisted?
          response = client.patch(endpoint, body).dig('data')
        else
          response = client.post(endpoint, body).dig('data')
        end

        assign_attributes(format_response(response))

        true
      end
    end

    def format_body(attributes = {})
      {
        data: {
          type: model_name.element.camelize,
          attributes: attributes
        }
      }
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
      if persisted?
        "#{base_endpoint}/#{id}"
      else
        base_endpoint
      end
    end

    def pretty_print(pp)
      pp.object_address_group self do
        pp.breakable

        *head, tail = attributes.to_a

        head.each do |attr, value|
          pp.text "#{attr}: #{value.inspect}"
          pp.comma_breakable
        end

        pp.text "#{tail.first}: #{tail.last.inspect}"
      end
    end
  end
end
