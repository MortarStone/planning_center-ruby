# frozen_string_literal: true

require_relative '../model_helper'

field_data = PlanningCenter::FieldDatum.where(value: '4', client: @client)
print_field_data(field_data)
