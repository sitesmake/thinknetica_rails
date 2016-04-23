puts "Введите год:"
year = gets.chomp.to_i

puts "Введите месяц:"
month = gets.chomp.to_i

puts "Введите день:"
day = gets.chomp.to_i

days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
days_in_month[1] = 29 if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)

day_number = day
i = 1
while (i < month) do
  day_number += days_in_month[i-1]
  i += 1
end

puts "Это #{day_number} день."