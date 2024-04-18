# frozen_string_literal: true

require_relative '../model_helper'

subscription = PlanningCenter::Subscription.create(
  name: 'people.v2.events.field_definition.created',
  url: 'https://app.mortarstone.com/hooks/companies/4/planning_center/events',
  active: true,
  client: @client
)
print_subscription(subscription)
