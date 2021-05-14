# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module RecurringDonationDesignations
      def recurring_donation_designation(donation_id, id, params = {})
        get(
          "giving/v2/recurring_donations/#{donation_id}/designations/#{id}",
          params
        )
      end

      def recurring_donation_designations(donation_id, params = {})
        get(
          "giving/v2/recurring_donations/#{donation_id}/designations",
          params
        )
      end
    end
  end
end
