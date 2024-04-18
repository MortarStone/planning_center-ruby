# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.find_by(slug: 'mortarstone_3', client: @client)
tab.delete
print_tab(tab)
