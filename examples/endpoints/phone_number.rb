# frozen_string_literal: true

require_relative 'endpoint_helper'

phone_number = @client.phone_number(2_669_139, 60_503_519)
print_phone_number(phone_number)
