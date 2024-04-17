# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Subscriptions
      def subscriptions(params = {})
        get('webhooks/v2/subscriptions', params)
      end
    end
  end
end
