# frozen_string_literal: true

require_relative 'endpoint_helper'

marital_status = @client.marital_status(296_943)
print_marital_status(marital_status)
