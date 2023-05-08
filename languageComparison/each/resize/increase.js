numbers = ["one","two","three","four"]
numbers.forEach(function(value,index,array){
	if (value=="one") {
		numbers.push("five")
	}
	console.log("Index: "+ index + "; value: "+ value)
})
console.log(numbers)