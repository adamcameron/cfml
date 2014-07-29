#duck.rb
load "sep.rb"

i = 0
a = ['0100', 100.0]
while i < 2
	puts "Original: #{a[i]}"
	puts "Int: #{a[i].to_i}"
	i = i + 1
end
sep

begin
	puts '100' + 100.0
rescue
	puts "puts '100' + 100.0 won't work" # so don't agree that was an example of duck-typing
end