# frozen_string_literal: true

def print_emails(list)
  print_list('email', 'id', list)
end

def print_email(item)
  print_item('email', item)
end

def email_columns
  %w[
    id
    address
    location
    primary
    blocked
  ]
end
