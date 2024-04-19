# frozen_string_literal: true

require_relative '../model_helper'

people = PlanningCenter::Person.all(client: @client)
print_people(people)
