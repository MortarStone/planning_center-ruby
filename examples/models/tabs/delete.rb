# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.find_by(slug: 'mortarstone_6', client: @client)
tab.delete
print_tab(tab)
