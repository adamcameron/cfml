#homework2.rb

# Bonus problem: If you’re feeling the need for a little more, write
# a program that picks a random number. Let a player guess the
# number, telling the player whether the guess is too low or too high.
# (Hint: rand(10) will generate a random number from 0 to 9, and
# gets will read a string from the keyboard that you can translate to
# an integer.)

number = rand(10)
guess = 0 # so it's in scope
loop do
	puts "Have a guess"
	guess = gets.to_i
	break if guess == number
	puts "too low" if guess < number
	puts "too high" if guess > number
end
puts "you got it: #{guess} == #{number}"