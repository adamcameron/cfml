# grep.rb

def grep (file, pattern)
	File.open(file, "r") do |f|
		f.each_with_index do |line, i|
			puts "#{i+1}: #{line}" if line =~ pattern
		end
	end
end

grep "grep.rb", /\b\w{4}\b/
