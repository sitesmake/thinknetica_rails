puts "1 side of triangle:"
a = gets.chomp.to_i

puts "2 side of triangle:"
b = gets.chomp.to_i

puts "3 side of triangle:"
c = gets.chomp.to_i

pryamougolny = false

pryamougolny = true if a>b && a>c && a**2 == b**2 + c**2
pryamougolny = true if b>a && b>c && b**2 == a**2 + c**2
pryamougolny = true if c>a && c>b && c**2 == a**2 + b**2

if pryamougolny
  puts "Это прямоугольный треугольник"
elsif a==b && b==c
  puts "Это равносторонний треугольник"
else
  puts "Это обычный треугольник"
end

