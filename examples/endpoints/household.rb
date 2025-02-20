# frozen_string_literal: true

require_relative 'endpoint_helper'

household = @client.household(1_684_069)
print_household(household)
