# frozen_string_literal: true

def print_field_definitions(list)
  print_list('field_definition', 'id', list, %w[data])
end

def print_field_definition(item)
  print_item('field_definition', item, %w[data])
end

def field_definition_columns
  %w[
    id
    name
    data_type
    slug
    tab_id
    config
  ]
end
