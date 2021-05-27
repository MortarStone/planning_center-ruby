# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Emails
      def email(id, params = {})
        get(
          "people/v2/emails/#{id}",
          params
        )
      end

      def emails(params = {})
        # We need to order the emails by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'people/v2/emails',
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
