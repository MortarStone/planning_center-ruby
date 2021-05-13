# frozen_string_literal: true

require_relative 'helper'

recurring_donation_designations = @client.recurring_donation_designations(358_916)
print_recurring_donation_designations(recurring_donation_designations)
