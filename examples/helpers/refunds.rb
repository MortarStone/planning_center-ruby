# frozen_string_literal: true

def print_refunds(list)
  print_list('refund', 'id', list, %w[data])
end

def print_refund(item)
  print_item('refund', item, %w[data])
end

def refund_columns
  %w[
    id
    amount_cents
    refunded_at
  ]
end
