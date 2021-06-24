# frozen_string_literal: true

def print_inactive_reasons(list)
  print_list('inactive_reason', 'id', list)
end

def print_inactive_reason(item)
  print_item('inactive_reason', item)
end

def inactive_reason_columns
  %w[
    id
    value
  ]
end
