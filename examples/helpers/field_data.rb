# frozen_string_literal: true

def print_field_data(list)
  print_list('field_datum', 'id', list, %w[data])
end

def print_field_datum(item)
  print_item('field_datum', item, %w[data])
end

def field_datum_columns
  %w[
    id
    value
    person_id
    field_definition_id
  ]
end
