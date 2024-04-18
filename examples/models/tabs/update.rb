# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.find_by(slug: 'mortarstone5', client: @client)
tab.update(name: 'MortarStone3')
print_tab(tab)
