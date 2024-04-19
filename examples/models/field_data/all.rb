# frozen_string_literal: true

require_relative '../model_helper'

field_data = PlanningCenter::FieldDatum.all(client: @client)
print_field_data(field_data)
