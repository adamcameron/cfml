# getSubseriesTest.rb

load "getSubseries.rb"

result = getSubseries [], 0
puts "Should return an array\n" unless result.is_a? Array

result = getSubseries [100], 100
puts "Should return elements if there are any within the threshold\n" unless result == [100]

result = getSubseries [100,100], 500
puts "Should return a multi-element subseries\n" unless result == [100,100]

result = getSubseries [100,100,100,100,100,100], 500
puts "Total of elements should not be greater than threshold\n" unless result.inject(0){|sum,x| sum + x } <= 500

result = getSubseries [600,100,100,100,600,100,100,100,100,600], 500
puts "Should return a subsequent larger subseries\n" unless result == [100,100,100,100]

result = getSubseries [600,100,100,100,600,200,100,100,100,100,100,600], 500
puts "Should return a longer adjacent subseries\n" unless result == [100,100,100,100,100]

result = getSubseries [600,700,800,900], 500
puts "Should work when threshold is less than all items\n" unless result == []

result = getSubseries [600,700,800,900], 1000
puts "Should work when threshold is greater than all items\n" unless result == [900]

result = getSubseries [600,700,800,900], 5000
puts "Should work when threshold is greater than sum of all items\n" unless result == [600,700,800,900]

result = getSubseries [100,50,50,50,50,50,500,100,60,60,60,60,60,500], 500
unless result == [100,60,60,60,60,60] then
	puts "Should return subseries with highest tally when there are two equal-length subseries (second subseries is higher)\n" 
end

result = getSubseries [100,60,60,60,60,60,500,100,50,50,50,50,50,500], 500
unless result == [100,60,60,60,60,60]
	puts "Should return subseries with highest tally when there are two equal-length subseries (first subseries is higher)\n"
end