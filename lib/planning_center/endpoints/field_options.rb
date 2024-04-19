# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module FieldOptions
      def field_option(field_definition_id, id, params = {})
        get(
          "people/v2/field_definitions/#{field_definition_id}/field_options/#{id}",
          params
        )
      end

      def field_options(field_definition_id, params = {})
        get(
          "people/v2/field_definitions/#{field_definition_id}/field_options",
          params
        )
      end
    end
  end
end
