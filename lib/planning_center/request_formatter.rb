# frozen_string_literal: true

module PlanningCenter
  class RequestFormatter
    attr_accessor :params

    def initialize(params: {})
      @params = params
    end

    def call
      format_date_filters
      default_params.merge(params)
    end

    private

    def format_date_filters
      params.transform_values { |v| format_value(v) }
    end

    def format_value(value)
      case value.class
      when DateTime
        value.strftime('%Y-%m-%dT%H:%M:%S')
      when Date
        value.strftime('%Y-%m-%d')
      else
        value
      end
    end

    def default_params
      { per_page: 100, offset: 0 }
    end
  end
end
