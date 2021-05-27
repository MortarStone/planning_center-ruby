# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module MaritalStatuses
      def marital_status(id, params = {})
        get(
          "people/v2/marital_statuses/#{id}",
          params
        )
      end

      def marital_statuses(params = {})
        get(
          'people/v2/marital_statuses',
          params
        )
      end
    end
  end
end
