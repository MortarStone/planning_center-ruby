# frozen_string_literal: true

# READ ONLY - There is no need to implement create, delete, update or save
# methods for people. It is a little dangerous, and unnecessary for our purposes.

module PlanningCenter
  class Person < Base
    FIELDS = %i[id first_name last_name status created_at updated_at].freeze
    QUERIABLE_FIELDS = %i[first_name last_name status created_at updated_at].freeze

    attribute :id, :integer
    attribute :first_name, :string
    attribute :last_name, :string
    attribute :status, :string
    attribute :created_at, :datetime
    attribute :updated_at, :datetime

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :first_name, :last_name, presence: true

    def self.create
      raise NoMethodError, "The 'create' method is undefined for this model"
    end

    def self.update
      raise NoMethodError, "The 'update' method is undefined for this model"
    end

    def update
      raise NoMethodError, "The 'update' method is undefined for this model"
    end

    def delete
      raise NoMethodError, "The 'delete' method is undefined for this model"
    end

    def save
      raise NoMethodError, "The 'save' method is undefined for this model"
    end

    def self.base_endpoint
      'people/v2/people'
    end

    def field_data(**params)
      response = client.get(
        "people/v2/people/#{id}/field_data",
        { where: params, include: [:field_option] }
      )['data']

      response.map do |hsh|
        attrs = FieldDatum.format_response(hsh)
        FieldDatum.new(attrs, client: client, &:persist!)
      end
    end
  end
end
