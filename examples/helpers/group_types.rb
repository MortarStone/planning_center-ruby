# frozen_string_literal: true

def print_group_types(list)
  print_list('group_type', 'id', list)
end

def print_group_type(item)
  print_item('group_type', item)
end

def group_type_columns
  %w[
    id
    name
    description
    position
  ]
end
