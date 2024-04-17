# frozen_string_literal: true

require 'faraday'
require 'json'

require_relative 'request_formatter'
require_relative 'response_handler'

Dir[File.join(__dir__, 'endpoints', '*.rb')].each { |file| require file }
