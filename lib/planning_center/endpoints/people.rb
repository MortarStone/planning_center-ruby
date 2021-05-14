# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module People
      def person(id, params = {})
        get(
          "people/v2/people/#{id}",
          params
        )
      end

      def people(params = {})
        # We need to order the people by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'people/v2/people',
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
