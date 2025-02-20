# frozen_string_literal: true

def print_name_suffixes(list)
  print_list('name_suffix', 'id', list, %w[data])
end

def print_name_suffix(item)
  print_item('name_suffix', item, %w[data])
end

def name_suffix_columns
  %w[
    id
    value
  ]
end
