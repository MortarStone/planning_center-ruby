# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.all(client: @client).first

field_definition = PlanningCenter::FieldDefinition.create(
  tab_id: tab.id,
  data_type: 'boolean',
  name: 'Testing2',
  client: @client
)
print_field_definition(field_definition)
