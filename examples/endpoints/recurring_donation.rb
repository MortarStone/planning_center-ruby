# frozen_string_literal: true

require_relative 'endpoint_helper'

recurring_donation = @client.recurring_donation(1_150_348, include: %w[designations])
print_recurring_donation(recurring_donation)
