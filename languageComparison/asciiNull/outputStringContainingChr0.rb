# outputStringContainingChr0.rb
s = 0.chr + "foo#{0.chr}"
puts "#{s}:#{s.length}:#{s.slice(0).ord}"