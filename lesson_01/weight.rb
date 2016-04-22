puts "What's your name?"
name = gets.chomp

puts "What's your height"
height = gets.chomp

weight = height.to_i - 110

if weight < 0
  puts "#{name}, your weight is optimal"
else
  puts "#{name}, your ideal weight is: #{weight}"
end

