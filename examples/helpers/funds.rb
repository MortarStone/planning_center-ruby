# frozen_string_literal: true

def print_funds(list)
  print_list('fund', 'id', list, %w[data])
end

def print_fund(item)
  print_item('fund', item, %w[data])
end

def fund_columns
  %w[
    id
    name
  ]
end
