# frozen_string_literal: true

require_relative 'endpoint_helper'

refund = @client.refund(53_134_447)
print_refund(refund)
