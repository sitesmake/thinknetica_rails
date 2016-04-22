puts "a?"
a = gets.chomp.to_f

puts "b?"
b  = gets.chomp.to_f

puts "c?"
c = gets.chomp.to_f

d = b**2 - 4*a*c

if d<0
  puts "корней нет"
elsif d==0
  x = -b/(2*a)
  puts "d = #{d}, один корень x = #{x}"
else
  x1 = (-b + Math.sqrt(d))/(2*a)
  x2 = (-b - Math.sqrt(d))/(2*a)
  puts "d = #{d}, x1 = #{x1}, x2 = #{x2}"
end
