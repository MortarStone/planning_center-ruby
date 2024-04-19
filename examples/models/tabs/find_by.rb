# frozen_string_literal: true

require_relative '../model_helper'

tab = PlanningCenter::Tab.find_by(slug: 'mortarstone_4', client: @client)
print_tab(tab)
