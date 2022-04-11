# frozen_string_literal: true

module PlanningCenter
  class FieldDatum < Base
    IMMUTABLE_FIELDS = %i[id file file_content_type file_name file_size
                          person_id].freeze
    FIELDS = %i[field_definition_id value].freeze

    attribute :id, :integer
    attribute :field_definition_id, :integer
    attribute :file, :string
    attribute :file_content_type, :string
    attribute :file_name, :string
    attribute :file_size, :integer
    attribute :person_id, :integer
    attribute :value, :string

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :field_definition_id, :person_id, presence: true

    # belongs_to :person
    # belongs_to :field_definition

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
