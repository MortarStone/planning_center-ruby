# frozen_string_literal: true

def print_people(list)
  print_list('person', 'id', list)
end

def print_person(item)
  print_item('person', item)
end

def person_columns
  %w[
    id
    first_name
    last_name
    status
  ]
end
