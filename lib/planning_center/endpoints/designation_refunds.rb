# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module DesignationRefunds
      def designation_refunds(donation_id, params = {})
        # There is only one refund per donation and the refund can only be accessed
        # through the donation
        get(
          "giving/v2/donations/#{donation_id}/refund/designation_refunds",
          params
        )
      end
    end
  end
end
