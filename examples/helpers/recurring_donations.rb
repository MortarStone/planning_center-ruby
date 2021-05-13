# frozen_string_literal: true

def print_recurring_donations(list)
  print_list('recurring_donation', 'id', list)
end

def print_recurring_donation(item)
  print_item('recurring_donation', item)
end

def recurring_donation_columns
  %i[
    id
    amount_cents
    status
    last_donation_received_at
    next_occurrence
  ]
end
