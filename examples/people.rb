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
  ]
)
print_people(people)
