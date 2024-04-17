# frozen_string_literal: true

require 'pry'
require 'date'
require 'bigdecimal'
require_relative '../../lib/planning_center'
require_relative '../print_helper'

require 'dotenv'
Dotenv.load(File.join(__dir__, '..', '..', '.env'))

# PlanningCenter.configure do |config|
#   config.access_token = ENV.fetch('ACCESS_TOKEN', nil)
# end

# If the following is commented out, the examples will use the above
# configuration. If not, it will use the below client. Both options
# should work.
@client = PlanningCenter::Client.new(
  access_token: ENV.fetch('ACCESS_TOKEN')
)
