# frozen_string_literal: true

require 'pry'
require 'date'
require 'bigdecimal'
require_relative '../../lib/planning_center'
require_relative '../print_helper'

require 'dotenv'
Dotenv.load(File.join(__dir__, '..', '..', '.env'))

@client = PlanningCenter::Client.new(
  access_token: ENV.fetch('ACCESS_TOKEN')
)