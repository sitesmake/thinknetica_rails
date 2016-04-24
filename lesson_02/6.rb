products = {}

loop do
  puts "Название товара:"
  title = gets.chomp

  break if title == "стоп"

  puts "Цена за единицу:"
  price = gets.chomp.to_f

  puts "Количество купленного товара:"
  quantity = gets.chomp.to_f

  products[title] = { price: price, quantity: quantity }
end

total = 0

products.each do |k,v|
  line_price = v[:price] * v[:quantity]
  total += line_price
  puts "#{k}: #{v[:quantity]} * #{v[:price]} = #{line_price}"
end

puts "Итого: #{total}"