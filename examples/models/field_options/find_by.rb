# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: 'tags', client: @client
)

field_option = PlanningCenter::FieldOption.find_by(
  field_definition_id: field_definition.id,
  value: 'Lapsed',
  client: @client
)
print_field_option(field_option)
