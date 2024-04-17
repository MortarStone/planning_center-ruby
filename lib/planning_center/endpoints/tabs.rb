# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Tabs
      def tab(id, params = {})
        get(
          "people/v2/tabs/#{id}",
          params
        )
      end

      def tabs(params = {})
        get(
          'people/v2/tabs',
          params
        )
      end
    end
  end
end
