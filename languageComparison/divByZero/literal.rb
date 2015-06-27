## literal.rb

operator = ARGV[0] || "divide"
begin
	if operator == 'divide' then
		result = 1 / 0
	else
		result = 1 % 0
	end
rescue Exception => e
	puts "Operator: #{operator}\n"
	puts e
end
