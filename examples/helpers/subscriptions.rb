# frozen_string_literal: true

def print_subscriptions(list)
  print_list('subscription', 'id', list, %w[data])
end

def print_subscription(item)
  print_item('subscription', item, %w[data])
end

def subscription_columns
  %w[
    id
    name
    url
    active
    application_id
  ]
end
