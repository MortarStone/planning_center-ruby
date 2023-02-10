# frozen_string_literal: true

module PlanningCenter
  class Configuration
    attr_accessor :access_token

    def initialize
      @access_token = ENV.fetch('ACCESS_TOKEN')
    end
  end
end
