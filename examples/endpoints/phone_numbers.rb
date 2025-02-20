# frozen_string_literal: true

require_relative 'endpoint_helper'

phone_numbers = @client.phone_numbers(133_280_614)
print_phone_numbers(phone_numbers)
