months = { jan: 31, feb: 28, mar: 31, apr: 30, may: 31, jun: 30, jul: 31, aug: 31, sep: 30, oct: 31, noy: 30, dec: 31 }

months.each do |month, day|
  puts month if day==31
end