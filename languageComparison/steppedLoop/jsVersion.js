

oddNumbersAsString = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"]
	.filter(function(_,i){return (i+1) % 2;})
	.reduce(function(combined, oddNumber){
		return combined + oddNumber + String.fromCharCode(10);
	}, "");

console.log(oddNumbersAsString);
process.exit(1);

numbers = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"];

console.log("Using filter");
oddNumbers = numbers.filter(function(_,i){return i % 2;});
console.dir(oddNumbers);
console.log("=======================");

console.log("Reducing filtered numbers");
oddNumbersAsString = oddNumbers.reduce(function(combined, oddNumber){
	return combined + oddNumber + String.fromCharCode(10);
}, "");
console.log(oddNumbersAsString);
console.log("=======================");


console.log("Stepped for loop");
for (i=1; i < numbers.length; i+=2){
	console.log(numbers[i]);
}
console.log("=======================");
