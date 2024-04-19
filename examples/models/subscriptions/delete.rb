# frozen_string_literal: true

require_relative '../model_helper'

subscription = PlanningCenter::Subscription.all(client: @client).last
subscription.delete
print_subscription(subscription)
