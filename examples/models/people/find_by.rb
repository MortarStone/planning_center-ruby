# frozen_string_literal: true

require_relative '../model_helper'

person = PlanningCenter::Person.find_by(
  first_name: 'Deb',
  last_name: 'Kallina',
  client: @client
)
print_person(person)
