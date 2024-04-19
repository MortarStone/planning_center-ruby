# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.create(
  name: 'MortarStone5',
  client: @client
)
print_tab(tab)
