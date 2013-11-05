<cfscript>
	// example 1 using an inline callback
	numbers = [1,2,3,4,5];
	doubledNumbers = [];
	arrayEach(numbers, function(number){
		arrayAppend(doubledNumbers, number * 2);
	});
	writeOutput(arrayToList(doubledNumbers)); // outputs 2,4,6,8


	// example 2, using a separately-defined function
	numbers = [1,2,3,4,5];
	doubledNumbers = [];

	function double(number){
		arrayAppend(doubledNumbers, number * 2);
	}
	arrayEach(numbers, double); // here we use the NAME of an existing UDF
	writeOutput(arrayToList(doubledNumbers)); // outputs 2,4,6,8
</cfscript>