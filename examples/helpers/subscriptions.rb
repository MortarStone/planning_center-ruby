# frozen_string_literal: true

def print_subscriptions(list)
  print_list('subscription', 'id', list)
end

def print_subscription(item)
  print_item('subscription', item)
end

def subscription_columns
  %w[
    id
    name
    url
    active
  ]
end
