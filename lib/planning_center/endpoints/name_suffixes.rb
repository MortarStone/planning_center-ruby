# frozen_string_literal: true

module PlanningCenter
  module Endpoints
    module NameSuffixes
      def name_suffix(id, params = {})
        get(
          "people/v2/name_suffixes/#{id}",
          params
        )
      end

      def name_suffixes(params = {})
        get(
          'people/v2/name_suffixes',
          params
        )
      end
    end
  end
end
