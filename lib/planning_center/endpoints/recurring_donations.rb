# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module RecurringDonations
      def recurring_donation(id, params = {})
        get(
          "giving/v2/recurring_donations/#{id}",
          params
        )
      end

      def recurring_donations(params = {})
        get(
          'giving/v2/recurring_donations',
          params
        )
      end
    end
  end
end
