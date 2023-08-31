# frozen_string_literal: true

def print_webhook_subscriptions(list)
  print_list('webhook_subscription', 'id', list)
end

def print_webhook_subscription(item)
  print_item('webhook_subscription', item)
end

def webhook_subscription_columns
  %w[
    id
    name
    url
    active
  ]
end
