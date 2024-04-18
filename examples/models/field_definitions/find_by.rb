# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: 'gift_count',
  client: @client
)
print_field_definition(field_definition)
