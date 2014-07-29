# arrayMethods.rb

load "../day1/sep.rb"

begin
	puts "a[0] = 0"
	puts a[0] = 0
rescue Exception => e
	puts e	
end
sep

puts "a = []"
puts a = []
sep

puts "[1].class"
puts [1].class
sep

puts "[1].methods.include?('[]')"
puts [1].methods.include?('[]')
sep

puts "# use [1].methods.include?(:[]) on ruby 1.9"
puts [1].methods.include?(:[])
sep


puts "a[0] = 'zero'"
puts a[0] = 'zero'
sep

puts "a[1] = 1"
puts a[1] = 1
sep

puts "a[2] = ['two', 'things']"
puts a[2] = ['two', 'things']
sep

puts "a"
puts a
sep

puts "a = [[1, 2, 3], [10, 20, 30], [40, 50, 60]]"
puts a = [[1, 2, 3], [10, 20, 30], [40, 50, 60]]
sep

puts "a[0][0]"
puts a[0][0]
sep

puts "a[1][2]"
puts a[1][2]
sep

puts "a = [1]"
puts a = [1]
sep

puts "a.push(1)"
puts a.push(1)
sep

puts "a = [1]"
puts a = [1]
sep

puts "a.push(2)"
puts a.push(2)
sep

puts "a.pop"
puts a.pop
sep

puts "a.pop"
puts a.pop
sep

puts "a"
puts a