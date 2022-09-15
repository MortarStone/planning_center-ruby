# frozen_string_literal: true

module PlanningCenter
  class FieldDefinition < Base
    IMMUTABLE_FIELDS = %i[id tab_id].freeze
    FIELDS = %i[config data_type deleted_at name sequence slug].freeze

    DATA_TYPES = %w[text string date file boolean
                    select checkboxes number header].freeze

    attribute :id, :integer
    attribute :config, :string
    attribute :data_type, :string
    attribute :deleted_at, :datetime
    attribute :name, :string
    attribute :sequence, :integer
    attribute :slug, :string
    attribute :tab_id, :integer

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :name, :tab_id, presence: true
    validates :data_type, inclusion: { in: DATA_TYPES }, presence: true

    # belongs_to :tab

    def tab
      Tab.find(tab_id)
    end

    def field_options
      FieldOption.all(field_definition_id: id)
    end

    private

    def endpoint
      if persisted?
        "#{base_endpoint}/#{id}"
      else
        "people/v2/tabs/#{tab_id}/field_definitions"
      end
    end
  end
end
