# frozen_string_literal: true

def print_recurring_donations(list)
  print_list('recurring_donation', 'id', list, %w[data])
end

def print_recurring_donation(item)
  print_item('recurring_donation', item, %w[data])
end

def recurring_donation_columns
  %w[
    id
    amount_cents
    status
    last_donation_received_at
    next_occurrence
  ]
end
