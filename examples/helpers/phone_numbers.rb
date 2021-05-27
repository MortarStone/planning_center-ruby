# frozen_string_literal: true

def print_phone_numbers(list)
  print_list('phone_number', 'id', list)
end

def print_phone_number(item)
  print_item('phone_number', item)
end

def phone_number_columns
  %w[
    id
    number
    carrier
    location
    primary
  ]
end
