# frozen_string_literal: true

require_relative '../model_helper'

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: :giving_band, client: @client
)
person = PlanningCenter::Person.all(client: @client).first

field_datum = PlanningCenter::FieldDatum.create(
  field_definition_id: field_definition.id,
  person_id: person.id,
  value: '3',
  client: @client
)
print_field_datum(field_datum)
