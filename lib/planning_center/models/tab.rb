# frozen_string_literal: true

module PlanningCenter
  class Tab < Base
    FIELDS = %i[id slug name sequence].freeze
    CREATABLE_FIELDS = %i[name sequence].freeze
    UPDATABLE_FIELDS = %i[name sequence].freeze
    QUERIABLE_FIELDS = %i[name sequence slug].freeze

    attribute :id, :integer
    attribute :name, :string
    attribute :sequence, :integer
    attribute :slug, :string

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :name, presence: true

    def self.base_endpoint
      'people/v2/tabs'
    end
  end
end
