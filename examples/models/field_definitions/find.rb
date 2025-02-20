# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find(720_097, client: @client)
print_field_definition(field_definition)
