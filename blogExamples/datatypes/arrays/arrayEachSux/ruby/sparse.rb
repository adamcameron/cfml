rainbow = []
rainbow[0] = "Whero"
rainbow[2] = "Kowhai"
rainbow[4] = "Kikorangi"
rainbow[6] = "Mawhero"

callCounter = 0
rainbow.each do |v|
		callCounter += 1
		puts("Called for #{v}")
end
puts("callback was called: #{callCounter} times")