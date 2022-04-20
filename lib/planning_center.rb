# frozen_string_literal: true

require_relative 'planning_center/client'
require_relative 'planning_center/exceptions'
require_relative 'planning_center/version'
require 'planning_center/configuration'
require 'active_model'
Dir[File.join(__dir__, 'planning_center', 'models', '*.rb')].sort.each { |file| require file }

module PlanningCenter
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end
