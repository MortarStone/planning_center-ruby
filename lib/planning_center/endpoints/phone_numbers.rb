# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module PhoneNumbers
      def phone_number(person_id, id, params = {})
        get(
          "people/v2/people/#{person_id}/phone_numbers/#{id}",
          params
        )
      end

      def phone_numbers(person_id, params = {})
        # We need to order the phone_numbers by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          "people/v2/people/#{person_id}/phone_numbers",
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
