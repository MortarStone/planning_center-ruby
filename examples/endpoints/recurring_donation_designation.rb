# frozen_string_literal: true

require_relative 'endpoint_helper'

recurring_donation_designation = @client.recurring_donation_designation(1_150_348, 1_218_357)
print_recurring_donation_designation(recurring_donation_designation)
