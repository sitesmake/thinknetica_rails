puts "1 side of triangle:"
a = gets.chomp.to_f

puts "2 side of triangle:"
b = gets.chomp.to_f

puts "3 side of triangle:"
c = gets.chomp.to_f

sides = [a,b,c].sort

if sides.uniq.one?
  puts "Это равносторонний треугольник"
elsif sides[2]**2 == sides[0]**2 + sides[1]**2
  puts "Это прямоугольный треугольник"
else
  puts "Это обычный треугольник"
end

