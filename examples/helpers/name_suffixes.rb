# frozen_string_literal: true

def print_name_suffixes(list)
  print_list('name_suffix', 'id', list)
end

def print_name_suffix(item)
  print_item('name_suffix', item)
end

def name_suffix_columns
  %w[
    id
    value
  ]
end
