# frozen_string_literal: true

require_relative 'helper'

refund = @client.refund(28_611)
print_refund(refund)
