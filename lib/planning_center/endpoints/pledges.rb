# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Pledges
      def pledge(id, params = {})
        get(
          "giving/v2/pledges/#{id}",
          params
        )
      end

      def pledges(params = {})
        # We need to order the pledges by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'giving/v2/pledges',
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
