# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Households
      def household(id, params = {})
        get(
          "people/v2/households/#{id}",
          params
        )
      end

      def households(params = {})
        # We need to order the households by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'people/v2/households',
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
