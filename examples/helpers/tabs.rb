# frozen_string_literal: true

def print_tabs(list)
  print_list('tab', 'id', list, %w[data])
end

def print_tab(item)
  print_item('tab', item, %w[data])
end

def tab_columns
  %w[
    id
    name
    sequence
    slug
  ]
end
