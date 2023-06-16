# frozen_string_literal: true

require_relative 'helper'

donations = @client.donations(
  include: [:designations],
  where: [
    'where[received_at][gt]=2023-06-01T12:00:00Z',
    'where[received_at][lt]=2023-06-02T12:00:00Z'
  ]
)
print_donations(donations)
