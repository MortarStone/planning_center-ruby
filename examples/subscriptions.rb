# frozen_string_literal: true

require_relative 'helper'

subscriptions = @client.subscriptions(
  where: [
    "where[url]=https://app.mortarstone.com/hooks/companies/8/planning_center/events"
  ]
)
print_subscriptions(subscriptions)
