## literalViaVariable.rb

operator = ARGV[0] || "divide"
divisor = 0
begin
	if operator == 'divide' then
		result = 1 / divisor
	else
		result = 1 % divisor
	end
rescue Exception => e
	puts "Operator: #{operator}\n"
	puts e
end
