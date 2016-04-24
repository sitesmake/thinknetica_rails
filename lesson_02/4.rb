alphabet = ('a'..'z').to_a

hash = {}

'aeiouy'.split('').each do |letter|
  hash[letter] = alphabet.index(letter) + 1
end

puts hash