# frozen_string_literal: true

def print_field_options(list)
  print_list('field_option', 'id', list, %w[data])
end

def print_field_option(item)
  print_item('field_option', item, %w[data])
end

def field_option_columns
  %w[
    id
    value
    sequence
  ]
end
