# comparableAndEnumerable.rb

puts "'begin' <=> 'end'"
puts 'begin' <=> 'end'
puts
puts

puts "'same' <=> 'same'"
puts 'same' <=> 'same'
puts
puts

puts "a = [5, 3, 4, 1]"
puts a = [5, 3, 4, 1]
puts
puts

puts "a.sort"
puts a.sort
puts
puts

puts "a.any? {|i| i > 6}"
puts a.any? {|i| i > 6}
puts
puts

puts "a.any? {|i| i > 4}"
puts a.any? {|i| i > 4}
puts
puts

puts "a.all? {|i| i > 4}"
puts a.all? {|i| i > 4}
puts
puts

puts "a.all? {|i| i > 0}"
puts a.all? {|i| i > 0}
puts
puts

puts "a.collect {|i| i * 2}"
puts a.collect {|i| i * 2}
puts
puts

puts "a.select {|i| i % 2 == 0 } # even"
puts a.select {|i| i % 2 == 0 } # even
puts
puts

puts "a.select {|i| i % 2 == 1 } # odd"
puts a.select {|i| i % 2 == 1 } # odd
puts
puts

puts "a.max"
puts a.max
puts
puts

puts "a.member?(2)"
puts a.member?(2)
puts
puts
