# frozen_string_literal: true

require_relative '../model_helper'

tabs = PlanningCenter::Tab.where(slug: '%2', client: @client)
print_tabs(tabs)
