# frozen_string_literal: true

def print_addresses(list)
  print_list('address', 'id', list)
end

def print_address(item)
  print_item('address', item)
end

def address_columns
  %w[
    id
    street
    city
    state
    zip
    location
    primary
  ]
end
