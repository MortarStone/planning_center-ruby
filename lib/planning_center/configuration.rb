# frozen_string_literal: true

module PlanningCenter
  class Configuration
    attr_accessor :access_token

    def initialize
      @access_token = ENV['ACCESS_TOKEN']
    end
  end
end
