# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.all(client: @client).first

field_definition = PlanningCenter::FieldDefinition.find_or_create_by(
  tab_id: tab.id,
  data_type: 'boolean',
  name: 'Testing',
  client: @client
)
print_field_definition(field_definition)
