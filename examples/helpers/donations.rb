# frozen_string_literal: true

def print_donations(list)
  print_list('donation', 'id', list)
end

def print_donation(item)
  print_item('donation', item)
end

def donation_columns
  %w[
    id
    amount_cents
    received_at
  ]
end
