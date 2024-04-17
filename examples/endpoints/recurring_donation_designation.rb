# frozen_string_literal: true

require_relative 'endpoint_helper'

recurring_donation_designation = @client.recurring_donation_designation(358_916, 383_099)
print_recurring_donation_designation(recurring_donation_designation)
