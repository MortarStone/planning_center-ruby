# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Refunds
      def refund(donation_id, params = {})
        # There is only one refund per donation and the refund can only be accessed
        # through the donation
        get(
          "giving/v2/donations/#{donation_id}/refund",
          params
        )
      end
    end
  end
end
