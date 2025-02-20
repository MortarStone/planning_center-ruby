# frozen_string_literal: true

require_relative 'endpoint_helper'

field_definition = @client.field_definition(720_096)
print_field_definition(field_definition)
