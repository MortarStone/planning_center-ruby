# frozen_string_literal: true

require_relative '../model_helper'

field_datum = PlanningCenter::FieldDatum.find_by(value: '4', client: @client)
print_field_datum(field_datum)
