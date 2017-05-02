<cfscript>
numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"],
	[5,"five","rima"],
	[6,"six","ono"],
	[7,"seven","whitu"],
	[8,"eight","waru"],
	[9,"nine","iwa"],
	[10,"ten","tekau"]
]);

try {
	numbersAsArray = numbers.reduce(function(numbers=[], number){
		return numbers.append(number);
	});
	writeDump(numbersAsArray);
} catch (any e){
	writeDump([e.message]);
}
try {
	numbersAsArray = queryReduce(numbers, function(numbers=[], number){
		return numbers.append(number);
	});
	writeDump(numbersAsArray);
} catch (any e){
	writeDump([e.message]);
}
try {
	numbersAsArray = numbers.reduce(function(numbers, number){
		return numbers.append(number);
	}, []);
	writeDump(numbersAsArray);
} catch (any e){
	writeDump([e.message]);
}

</cfscript>