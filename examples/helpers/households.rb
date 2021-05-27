# frozen_string_literal: true

def print_households(list)
  print_list('household', 'id', list)
end

def print_household(item)
  print_item('household', item)
end

def household_columns
  %w[
    id
    name
    member_count
    primary_contact_name
    primary_contact_id
  ]
end
