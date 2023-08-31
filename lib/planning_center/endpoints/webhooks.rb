# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Webhooks
      def subscriptions(params = {})
        get('webhooks/v2/subscriptions', params)
      end
    end
  end
end
