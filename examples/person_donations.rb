# frozen_string_literal: true

require_relative 'helper'

donations = @client.person_donations(10_444_578)
print_donations(donations)
