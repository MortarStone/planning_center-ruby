# frozen_string_literal: true

require_relative '../model_helper'

field_datum = PlanningCenter::FieldDatum.find(159_589_481, client: @client)
print_field_datum(field_datum)
