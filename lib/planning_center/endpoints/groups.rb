# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Groups
      def group(id, params = {})
        get(
          "groups/v2/groups/#{id}",
          params
        )
      end

      def groups(params = {})
        get(
          'groups/v2/groups',
          params
        )
      end
    end
  end
end
