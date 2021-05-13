# frozen_string_literal: true

def print_campuses(list)
  print_list('campus', 'id', list)
end

def print_campus(item)
  print_item('campus', item)
end

def campus_columns
  %i[
    id
    name
  ]
end
