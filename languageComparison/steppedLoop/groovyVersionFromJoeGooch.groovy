numbers = ["tahi", "tahi", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"];
numbers.findAll({ it -> numbers.indexOf(it)%2 != 1}).eachWithIndex({ it,idx -> println("${idx+1}: ${it}") })