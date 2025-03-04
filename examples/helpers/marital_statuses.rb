# frozen_string_literal: true

def print_marital_statuses(list)
  print_list('marital_status', 'id', list, %w[data])
end

def print_marital_status(item)
  print_item('marital_status', item, %w[data])
end

def marital_status_columns
  %w[
    id
    value
  ]
end
