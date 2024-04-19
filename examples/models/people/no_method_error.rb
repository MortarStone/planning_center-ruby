# frozen_string_literal: true

require_relative '../model_helper'

person = PlanningCenter::Person.find_by(first_name: 'Deb', client: @client)
person.delete
print_person(person)
