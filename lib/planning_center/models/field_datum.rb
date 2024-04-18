# frozen_string_literal: true

module PlanningCenter
  class FieldDatum < Base
    FIELDS = %i[
      id person_id field_option_id field_definition_id value file file_size
      file_content_type file_name
    ].freeze
    CREATABLE_FIELDS = %i[value field_definition_id].freeze
    UPDATABLE_FIELDS = %i[value field_definition_id].freeze
    QUERIABLE_FIELDS = %i[value file file_size file_content_type file_name].freeze

    attribute :id, :integer
    attribute :field_definition_id, :integer
    attribute :person_id, :integer
    attribute :value, :string
    attribute :field_option_id, :integer
    attribute :file, :string
    attribute :file_size, :integer
    attribute :file_content_type, :string
    attribute :file_name, :string

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :field_definition_id, :person_id, presence: true

    def self.base_endpoint
      'people/v2/field_data'
    end

    def field_definition
      FieldDefinition.find(field_definition_id)
    end

    def person
      Person.find(person_id)
    end

    private

    def endpoint
      if persisted?
        "#{base_endpoint}/#{id}"
      else
        "people/v2/people/#{person_id}/field_data"
      end
    end
  end
end
