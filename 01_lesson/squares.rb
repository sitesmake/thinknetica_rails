puts "a?"
a = gets.chomp.to_i

puts "b?"
b  = gets.chomp.to_i

puts "c?"
c = gets.chomp.to_i

d = b**2 - 4*a*c

if d<0
  puts "корней нет"
elsif d==0
  x = -b/(2.0*a)
  puts "d = #{d}, один корень x = #{x}"
else
  x1 = (-b + Math.sqrt(d))/(2.0*a)
  x2 = (-b - Math.sqrt(d))/(2.0*a)
  puts "d = #{d}, x1 = #{x1}, x2 = #{x2}"
end
