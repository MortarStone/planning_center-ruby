# frozen_string_literal: true

def print_tabs(list)
  print_list('tab', 'id', list)
end

def print_tab(item)
  print_item('tab', item)
end

def tab_columns
  %w[
    id
    name
    sequence
    slug
  ]
end
