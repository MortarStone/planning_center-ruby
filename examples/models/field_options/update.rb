# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: 'tags', client: @client
)

field_option = PlanningCenter::FieldOption.all(
  field_definition_id: field_definition.id,
  client: @client
).last
field_option.update(value: 'MortarStone3')
print_field_option(field_option)
