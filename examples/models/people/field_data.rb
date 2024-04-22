# frozen_string_literal: true

require_relative '../model_helper'

person = PlanningCenter::Person.find(118_193_123, client: @client)
print_person(person)
puts "\n\n"

field_definition = PlanningCenter::FieldDefinition.find_by(
  slug: 'tags',
  client: @client
)

field_data = person.field_data(field_definition_id: field_definition.id)
print_field_data(field_data)
