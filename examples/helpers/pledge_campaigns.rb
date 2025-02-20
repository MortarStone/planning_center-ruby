# frozen_string_literal: true

def print_pledge_campaigns(list)
  print_list('pledge_campaign', 'id', list, %w[data])
end

def print_pledge_campaign(item)
  print_item('pledge_campaign', item, %w[data])
end

def pledge_campaign_columns
  %w[
    id
    amount_cents
  ]
end
