# frozen_string_literal: true

require_relative '../model_helper'

subscriptions = PlanningCenter::Subscription.all(client: @client)
print_subscriptions(subscriptions)
