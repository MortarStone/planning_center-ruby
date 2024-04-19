# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module FieldData
      def field_datum(id, params = {})
        get(
          "people/v2/field_data/#{id}",
          params
        )
      end

      def field_data(params = {})
        get(
          'people/v2/field_data',
          params
        )
      end
    end
  end
end
