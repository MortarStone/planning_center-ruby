# frozen_string_literal: true

module PlanningCenter
  class FieldOption < Base
    IMMUTABLE_FIELDS = %i[id field_definition_id].freeze
    FIELDS = %i[value sequence].freeze

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

    # belongs_to :field_definition

    class << self
      attr_accessor :field_definition_id

      def all(field_definition_id:)
        self.field_definition_id = field_definition_id

        super()
      end

      def where(field_definition_id:, **params)
        self.field_definition_id = field_definition_id

        super(**params)
      end

      def find(id, field_definition_id:)
        self.field_definition_id = field_definition_id

        super(id)
      end

      def create(field_definition_id:, **attributes, &block)
        self.field_definition_id = field_definition_id

        super(attributes, &block)
      end

      def base_endpoint
        "people/v2/field_definitions/#{field_definition_id}/field_options"
      end
    end

    def field_definition
      FieldDefinition.find(field_definition_id)
    end
  end
end
