# frozen_string_literal: true

def print_pledge_campaigns(list)
  print_list('pledge_campaign', 'id', list)
end

def print_pledge_campaign(item)
  print_item('pledge_campaign', item)
end

def pledge_campaign_columns
  %w[
    id
    amount_cents
  ]
end
