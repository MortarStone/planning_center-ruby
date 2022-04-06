# frozen_string_literal: true

module PlanningCenter
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
      { per_page: 100, offset: 0 }
    end

    def stringify_params
      arr = []
      default_params.merge(params).map do |k, v|
        if v.is_a?(Array)
          v = v.join('%2C')
        elsif is_a?(Date)
          v = v.strftime('%Y-%m-%d')
        elsif k == :where
          v.each { |k, v| arr << "where[#{k}]=#{v}" }
          next
        end
        arr << "#{k}=#{v}"
      end
      arr.join('&').gsub(' ', '%20')
    end
  end
end
