#homework.rb
load "sep.rb"

# A method that substitutes part of a string
# Information about Ruby’s regular expressions
puts ("this is a test string".gsub(/\b\w+\b/) { |match|
	match.reverse
}) 
sep


# Print the string “Hello, world.”
message = "hello world"
puts message
sep

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
s = "Hello, Ruby"
puts s.index "Ruby"
sep


# Print your name [five] times.
name = "Zachary"
(1..5).each {|i| puts "#{name}"}
sep


# Information about Ruby’s ranges
# Print the string “This is sentence number 1,” where the number 1 changes from 1 to [5].
(1..5).each {|i| puts "This is sentence number #{i}"}
sep

# Run a Ruby program from a file.