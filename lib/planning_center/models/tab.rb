# frozen_string_literal: true

module PlanningCenter
  class Tab < Base
    IMMUTABLE_FIELDS = %i[id slug].freeze
    FIELDS = %i[name sequence].freeze

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
  end
end
