# frozen_string_literal: true

module PlanningCenter
  class Configuration
    attr_accessor :access_token

    def initialize
      @access_token = nil
    end
  end
end
