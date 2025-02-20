# frozen_string_literal: true

def print_groups(list)
  print_list('group', 'id', list, %w[data])
end

def print_group(item)
  print_item('group', item, %w[data])
end

def group_columns
  %w[
    id
    name
    description
    membership_count
  ]
end
