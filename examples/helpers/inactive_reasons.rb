# frozen_string_literal: true

def print_inactive_reasons(list)
  print_list('inactive_reason', 'id', list, %w[data])
end

def print_inactive_reason(item)
  print_item('inactive_reason', item, %w[data])
end

def inactive_reason_columns
  %w[
    id
    value
  ]
end
