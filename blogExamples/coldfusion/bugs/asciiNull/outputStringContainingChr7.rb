# outputStringContainingChr7.rb
s = 7.chr + "foo#{7.chr}"
puts "#{s}:#{s.length}:#{s.slice(0).ord}"