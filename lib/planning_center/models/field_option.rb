# frozen_string_literal: true

module PlanningCenter
  class FieldOption < Base
    FIELDS = %i[id value sequence field_definition_id].freeze
    CREATABLE_FIELDS = %i[value sequence].freeze
    UPDATABLE_FIELDS = %i[value sequence].freeze
    QUERIABLE_FIELDS = %i[value sequence].freeze

    attribute :id, :integer
    attribute :value, :string
    attribute :sequence, :integer
    attribute :field_definition_id, :integer

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :value, presence: true

    class << self
      attr_accessor :field_definition_id
    end

    def self.base_endpoint
      "people/v2/field_definitions/#{field_definition_id}/field_options"
    end

    def self.all(field_definition_id:, client: nil)
      self.field_definition_id = field_definition_id

      super(client: client)
    end

    def self.where(field_definition_id:, client: nil, **params)
      self.field_definition_id = field_definition_id

      super(client: client, **params)
    end

    def self.find(id, field_definition_id:, client: nil)
      self.field_definition_id = field_definition_id

      super(id, client: client)
    end

    def self.create(field_definition_id:, client: nil, **attributes, &block)
      self.field_definition_id = field_definition_id

      super(client: client, **attributes, &block)
    end

    def field_definition
      FieldDefinition.find(field_definition_id)
    end
  end
end
