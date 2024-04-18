# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.all(client: @client).last
field_definition.delete
print_field_definition(field_definition)
