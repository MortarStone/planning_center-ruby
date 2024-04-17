# frozen_string_literal: true

require_relative 'endpoint_helper'

phone_numbers = @client.phone_numbers(2_669_139)
print_phone_numbers(phone_numbers)
