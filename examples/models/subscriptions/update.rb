# frozen_string_literal: true

require_relative '../model_helper'

subscription = PlanningCenter::Subscription.all(client: @client).first
subscription.update(active: false)
print_subscription(subscription)
