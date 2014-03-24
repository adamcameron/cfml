iterations = 0
[7,5,3,1,2,4,6,8].sort { |v1,v2|
    iterations = iterations + 1
    puts "%d: Comparing %d, %d"  % [iterations,v1,v2]
    v1 <=> v2
}