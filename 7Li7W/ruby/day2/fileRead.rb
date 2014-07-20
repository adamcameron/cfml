# fileRead.rb

f = File.open("fileRead.rb", "r")
f.each_line do |line|
	puts line
end
f.close
puts
puts

File.open("fileRead.rb", "r") do |f|
	f.each_with_index do |line, i|
		puts "#{i+1}: #{line}"
	end
end
puts
puts

File.open("fileRead.rb") do |f|
	loop do
		break unless line = f.gets
		puts "#{f.lineno}: #{line}"
	end
end
puts
puts