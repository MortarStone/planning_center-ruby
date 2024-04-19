# frozen_string_literal: true

require_relative '../model_helper'

people = PlanningCenter::Person.where(last_name: 'Rogers', client: @client)
print_people(people)
