fibo = [1,1]

while fibo.last < 100 do
  fibo << ( fibo[-1] + fibo[-2] )
end

fibo.pop

puts fibo