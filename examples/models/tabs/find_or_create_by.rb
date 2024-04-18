# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.find_or_create_by(
  name: 'MortarStone 6',
  client: @client
)
print_tab(tab)
