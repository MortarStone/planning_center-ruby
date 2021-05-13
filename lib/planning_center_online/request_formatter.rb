# frozen_string_literal: true

module PlanningCenterOnline
  class RequestFormatter
    attr_accessor :path, :params

    def initialize(path:, params: {})
      @path = path
      @params = params
    end

    def call
      "#{path}?#{stringify_params}"
    end

    private

    def default_params
      { page_size: 100, page: 1 }
    end

    def stringify_params
      arr = []
      default_params.merge(params).map do |k, v|
        case v
        when is_a?(Array)
          v = v.join('%2C')
        when is_a?(Date)
          v = v.strftime('%Y-%m-%d')
        end
        arr << "#{k}=#{v}"
      end
      arr.join('&').gsub(' ', '%20')
    end
  end
end
