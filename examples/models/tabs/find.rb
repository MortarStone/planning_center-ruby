# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.find(161_146, client: @client)
print_tab(tab)
