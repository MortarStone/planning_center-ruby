# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: 'tags', client: @client
)

field_options = PlanningCenter::FieldOption.where(
  field_definition_id: field_definition.id,
  value: 'Member%',
  client: @client
)
print_field_options(field_options)
