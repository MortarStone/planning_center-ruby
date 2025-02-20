# frozen_string_literal: true

def print_campuses(list)
  print_list('campus', 'id', list, %w[data])
end

def print_campus(item)
  print_item('campus', item, %w[data])
end

def campus_columns
  %w[
    id
    name
  ]
end
