# match.rb
input = ARGV[0] || ""
pattern = "^\\d*$"
match =  input.match(pattern)
puts "input " + input
puts "match " + (match ? match.string : "match not defined")