# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module InactiveReasons
      def inactive_reason(id, params = {})
        get(
          "people/v2/inactive_reasons/#{id}",
          params
        )
      end

      def inactive_reasons(params = {})
        get(
          'people/v2/inactive_reasons',
          params
        )
      end
    end
  end
end
