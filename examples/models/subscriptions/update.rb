# frozen_string_literal: true

require_relative '../model_helper'

subscription = PlanningCenter::Subscription.find(332_052, client: @client)
subscription.update(active: false)
print_subscription(subscription)
