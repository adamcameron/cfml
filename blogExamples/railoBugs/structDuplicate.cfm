<cfscript>
	numbers = {
		sequence = [
			{en="one", mi="tahi"},
			{en="two", mi="rua"},
			{en="three", mi="toru"},
			{en="four", mi="what"}
		],
		lookups = {
			en	= {},
			mi	= {}
		}
	};
	
	for (number in numbers.sequence){
		numbers.lookups.en[number.en] = number;
		numbers.lookups.mi[number.mi] = number;
	}
	
	writeDump(numbers.sequence[1]);
	writeDump(numbers.lookups.en.two);
	writeDump(numbers.lookups.mi.toru);
	writeOutput("<hr />");
	numbersToo = duplicate(numbers);
	numbersToo.sequence[1].ja = "ichi";
	
	writeDump(numbersToo.sequence[1]);
	writeDump(numbersToo.lookups.en.one);
	writeDump(numbersToo.lookups.mi.tahi);
</cfscript>