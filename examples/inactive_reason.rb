# frozen_string_literal: true

require_relative 'helper'

inactive_reason = @client.inactive_reason(296_937)
print_inactive_reason(inactive_reason)
