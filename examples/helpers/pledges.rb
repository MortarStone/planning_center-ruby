# frozen_string_literal: true

def print_pledges(list)
  print_list('pledge', 'id', list, %w[data])
end

def print_pledge(item)
  print_item('pledge', item, %w[data])
end

def pledge_columns
  %w[
    id
    amount_cents
  ]
end
