<cfscript>
numbersAsArray = queryExecute("SELECT * FROM numbers")
	.reduce(function(rows, row){
		return rows.append(row);
	}, []);

writeDump(numbersAsArray);
</cfscript>