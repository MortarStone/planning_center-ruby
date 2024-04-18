# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module GroupTypes
      def group_type(id, params = {})
        get(
          "groups/v2/group_types/#{id}",
          params
        )
      end

      def group_types(params = {})
        get(
          'groups/v2/group_types',
          params
        )
      end
    end
  end
end
