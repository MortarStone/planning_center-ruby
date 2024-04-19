# frozen_string_literal: true

require_relative '../model_helper'

subscription = PlanningCenter::Subscription.find(149_835, client: @client)
print_subscription(subscription)
