# frozen_string_literal: true

require_relative 'endpoint_helper'

inactive_reasons = @client.inactive_reasons
print_inactive_reasons(inactive_reasons)
