# frozen_string_literal: true

require_relative '../model_helper'

person = PlanningCenter::Person.find(54_635_457, client: @client)
print_person(person)
