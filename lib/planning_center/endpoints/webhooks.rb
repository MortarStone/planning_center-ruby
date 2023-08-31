# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Webhooks
      def webhook_subscriptions
        get('webhooks/v2/subscriptions')
      end
    end
  end
end
