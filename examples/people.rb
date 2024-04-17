# frozen_string_literal: true

require_relative 'helper'

people = @client.people(
  include: %w[
    households
    marital_status
    emails
    phone_numbers
    inactive_reason
    addresses
    name_suffix
  ],
  # 'where[first_name]' => 'Am%'
  # 'where[created_at][gte]' => '2022-11-30T23:31:16Z'
  'where[created_at][gte]' => DateTime.new(2022, 11, 30, 23, 31, 16)
)
print_people(people)
