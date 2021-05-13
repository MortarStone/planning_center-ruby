# frozen_string_literal: true

def print_recurring_donation_designations(list)
  print_list('recurring_donation_designation', 'id', list)
end

def print_recurring_donation_designation(item)
  print_item('recurring_donation_designation', item)
end

def recurring_donation_designation_columns
  %i[
    id
    amount_cents
  ]
end
