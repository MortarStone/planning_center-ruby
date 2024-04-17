# frozen_string_literal: true

Dir[File.join(__dir__, 'helpers', '*.rb')].each { |file| require file }

def print_list(object_name, pk_id_name, response)
  list = response['data']
  if list.blank?
    puts 'Nothing found'
  else
    headers = column_headers(object_name)
    puts "There were #{list.count} #{object_name.pluralize} found"
    puts
    puts print_column_headers(headers)
    list.each_with_index do |item, index|
      print_row(index, item, headers)
    end
    puts
    print_duplicates(pk_id_name, list)
  end
end

def column_headers(object_name)
  send("#{object_name}_columns")
end

def print_column_headers(headers)
  headers = [:index] + headers
  puts headers.join(' :: ')
end

def print_row(index, item, column_headers)
  cells = [index]
  column_headers.each do |header|
    value = header == 'id' ? item[header] : item['attributes'][header]
    # value = value.to_digits if value.class == BigDecimal
    cells << value
  end
  puts cells.join(' :: ')
end

def print_item(object_name, response)
  item = response['data']
  puts
  if item.nil?
    puts 'Item not found'
  else
    column_headers(object_name).each do |header|
      value = header == 'id' ? item[header] : item['attributes'][header]
      # value = value.to_digits if value.class == BigDecimal
      puts "#{header}: #{value}"
    end
  end
end

def print_duplicates(pk_id_name, list)
  counts = {}
  list.each do |item|
    id = item[pk_id_name]
    counts[id] ||= 0
    counts[id] += 1
  end

  duplicates = counts.select { |_key, value| value > 1 }.keys - [nil]
  puts "There are #{duplicates.count} duplicates: #{duplicates.inspect}"
end
