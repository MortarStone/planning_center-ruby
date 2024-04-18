# frozen_string_literal: true

require_relative '../model_helper'

subscriptions = PlanningCenter::Subscription.where(
  name: 'people.v2.events.email%',
  client: @client
)
print_subscriptions(subscriptions)
