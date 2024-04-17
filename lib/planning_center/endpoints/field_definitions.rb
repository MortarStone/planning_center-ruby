# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module FieldDefinitions
      def field_definition(id, params = {})
        get(
          "people/v2/field_definitions/#{id}",
          params
        )
      end

      def field_definitions(params = {})
        get(
          'people/v2/field_definitions',
          params
        )
      end
    end
  end
end
