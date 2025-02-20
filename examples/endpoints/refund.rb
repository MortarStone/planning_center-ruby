# frozen_string_literal: true

require_relative 'endpoint_helper'

refund = @client.refund(174_664_326, include: %w[designation_refunds])
print_refund(refund)
