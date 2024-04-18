# frozen_string_literal: true

module PlanningCenter
  class Subscription < Base
    FIELDS = %i[
      id application_id authenticity_secret created_at updated_at
      active name url
    ].freeze
    CREATABLE_FIELDS = %i[active name url].freeze
    UPDATABLE_FIELDS = %i[active].freeze
    QUERIABLE_FIELDS = %i[application_id].freeze

    attribute :id, :integer
    attribute :application_id, :string
    attribute :authenticity_secret, :string
    attribute :created_at, :datetime
    attribute :updated_at, :datetime
    attribute :name, :string
    attribute :url, :string
    attribute :active, :boolean

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :url, :name, presence: true

    def self.base_endpoint
      'webhooks/v2/subscriptions'
    end
  end
end
