# frozen_string_literal: true

require_relative '../model_helper'

field_definitions = PlanningCenter::FieldDefinition.all(client: @client)
print_field_definitions(field_definitions)
