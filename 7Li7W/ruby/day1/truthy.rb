# truthy.rb
cond = 1
puts "#{cond} appears to be true." if cond

cond = "random string"
puts "#{cond} appears to be true." if cond

cond = 0
puts "#{cond} appears to be true." if cond

cond = true
puts "#{cond} appears to be true." if cond

cond = false
puts "#{cond} appears to be true." if cond
puts "#{cond} appears to be false." unless cond

cond = nil
puts "#{cond} appears to be true." if cond
puts "#{cond} appears to be false." unless cond