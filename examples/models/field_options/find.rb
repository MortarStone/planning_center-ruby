# frozen_string_literal: true

require_relative '../model_helper'

field_option = PlanningCenter::FieldOption.find(
  7_815_026,
  field_definition_id: 637_069,
  client: @client
)
print_field_option(field_option)
