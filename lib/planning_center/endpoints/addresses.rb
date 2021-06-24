# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module Addresses
      def address(id, params = {})
        get(
          "people/v2/addresses/#{id}",
          params
        )
      end

      def addresses(params = {})
        # We need to order the addresses by a value (created_at being the default),
        # because the results are not consistently ordered without it.
        get(
          'people/v2/addresses',
          { order: :created_at }.merge(params)
        )
      end
    end
  end
end
