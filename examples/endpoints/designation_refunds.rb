# frozen_string_literal: true

require_relative 'endpoint_helper'

designation_refunds = @client.designation_refunds(174_664_326)
print_designation_refunds(designation_refunds)
