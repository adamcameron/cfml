<cfscript>
	numbers = queryNew("id,mi");
	queryAddRow(numbers, 4);
	numbers.id[1] = 1; numbers.mi[1] = "tahi";
	numbers.id[2] = 2;
	numbers.id[3] = 3; numbers.mi[3] = "toru";
	numbers.id[4] = 4;

	writeOutput("isNull(numbers.mi[2]): #isNull(numbers.mi[2])#<br>");
	numbers.mi[2]?:'rua';
	writeDump(numbers);
	writeOutput("<hr>");

	writeOutput("isNull(numbers.mi[4]): #isNull(numbers.mi[4])#<br>");
	if (isNull(numbers.mi[4])){
		numbers.mi[4] = "wha";
	}
	writeDump(numbers);
</cfscript>