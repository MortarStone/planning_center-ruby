# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: :giving_band, client: @client
)
field_datum = PlanningCenter::FieldDatum.all(client: @client).last
field_datum.update(field_definition_id: field_definition.id, value: 1)
print_field_datum(field_datum)
