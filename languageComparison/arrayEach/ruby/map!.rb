rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"]
puts rainbow

rainbow.map! do |v|
	v.upcase
end

puts rainbow