# frozen_string_literal: true

def print_recurring_donation_designations(list)
  print_list('recurring_donation_designation', 'id', list, %w[data])
end

def print_recurring_donation_designation(item)
  print_item('recurring_donation_designation', item, %w[data])
end

def recurring_donation_designation_columns
  %w[
    id
    amount_cents
  ]
end
