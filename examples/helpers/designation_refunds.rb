# frozen_string_literal: true

def print_designation_refunds(list)
  print_list('designation_refund', 'id', list)
end

def print_designation_refund(item)
  print_item('designation_refund', item)
end

def designation_refund_columns
  %w[
    id
    amount_cents
  ]
end
