# frozen_string_literal: true

def print_addresses(list)
  print_list('address', 'id', list, %w[data])
end

def print_address(item)
  print_item('address', item, %w[data])
end

def address_columns
  %w[
    id
    street_line_1
    city
    state
    zip
    location
    primary
  ]
end
