# frozen_string_literal: true

require_relative 'endpoint_helper'

donations = @client.person_donations(16_512_877, include: %w[designations])
print_donations(donations)
