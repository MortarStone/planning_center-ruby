# frozen_string_literal: true

def print_marital_statuses(list)
  print_list('marital_status', 'id', list)
end

def print_marital_status(item)
  print_item('marital_status', item)
end

def marital_status_columns
  %w[
    id
    value
  ]
end
