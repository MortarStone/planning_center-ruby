# frozen_string_literal: true

module PlanningCenter
  class Person < Base
    IMMUTABLE_FIELDS = %i[id can_create_forms created_at demographic_avatar_url
                          directory_status name passed_background_check school_type
                          updated_at].freeze
    FIELDS = %i[accounting_administrator anniversary avatar birthdate child
                first_name gender given_name grade graduation_year inactivated_at
                last_name medical_notes membership middle_name nickname
                people_permissions primary_campus_id remote_id site_administrator
                status].freeze

    attribute :id, :integer
    attribute :accounting_administrator, :boolean
    attribute :anniversary, :date
    attribute :avatar, :string
    attribute :birthdate, :date
    attribute :can_create_forms, :boolean
    attribute :child, :boolean
    attribute :created_at, :datetime
    attribute :demographic_avatar_url, :string
    attribute :directory_status, :string
    attribute :first_name, :string
    attribute :gender, :string
    attribute :given_name, :string
    attribute :grade, :string
    attribute :graduation_year, :integer
    attribute :inactivated_at, :datetime
    attribute :last_name, :string
    attribute :medical_notes, :string
    attribute :membership, :string
    attribute :middle_name, :string
    attribute :name, :string
    attribute :nickname, :string
    attribute :passed_background_check, :boolean
    attribute :people_permissions, :string
    attribute :primary_campus_id, :integer
    attribute :remote_id, :integer
    attribute :school_type, :string
    attribute :site_administrator, :boolean
    attribute :status, :string
    attribute :updated_at, :datetime

    FIELDS.each do |attr|
      define_method "#{attr}=" do |value|
        public_send "#{attr}_will_change!"
        super(value)
      end
    end

    define_attribute_methods(*FIELDS)

    validates :first_name, :last_name, presence: true

    def field_data(params = {})
      params = { where: params }
      response = client.get("people/v2/people/#{id}/field_data", params)['data']

      response.map do |hsh|
        attrs = FieldDatum.format_response(hsh)
        FieldDatum.new attrs, &:persist!
      end
    end
  end
end
