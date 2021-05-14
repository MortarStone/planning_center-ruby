# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Campuses
      def campus(id, params = {})
        get(
          "people/v2/campuses/#{id}",
          params
        )
      end

      def campuses(params = {})
        # We need to order the campuses by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'people/v2/campuses',
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
