# frozen_string_literal: true

require_relative 'endpoint_helper'

donations = @client.donations(
  include: [:designations],
  'where[received_at][gt]' => DateTime.new(2023, 6, 1, 12, 0, 0),
  # 'where[received_at][gt]' => '2023-06-01T12:00:00Z',
  'where[received_at][lt]' => '2023-06-02T12:00:00Z'
)
print_donations(donations)
