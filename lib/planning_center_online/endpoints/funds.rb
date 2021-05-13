# frozen_string_literal: true

module PlanningCenterOnline
  module Endpoints
    module Funds
      def fund(id, params = {})
        get(
          "giving/v2/funds/#{id}",
          params
        )
      end

      def funds(params = {})
        get(
          'giving/v2/funds',
          params
        )
      end
    end
  end
end
