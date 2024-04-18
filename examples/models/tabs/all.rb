# frozen_string_literal: true

require_relative '../model_helper'

tabs = PlanningCenter::Tab.all(client: @client)
print_tabs(tabs)
