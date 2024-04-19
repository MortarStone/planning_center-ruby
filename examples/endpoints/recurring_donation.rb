# frozen_string_literal: true

require_relative 'endpoint_helper'

recurring_donation = @client.recurring_donation(362_440)
print_recurring_donation(recurring_donation)
