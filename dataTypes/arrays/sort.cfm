<cfscript>
	numbers = ["tahi", "rua", "toru", "wha"];
	numbers.sort(function(e1,e2){
		if (e1 == e2) return 0;
		return e1.len() > e2.len() ? 1 : -1;
	});

	writeDump(numbers);
</cfscript>