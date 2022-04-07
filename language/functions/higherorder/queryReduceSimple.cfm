<cfscript>
numbersAsArray = queryExecute("SELECT id,mi FROM numbers LIMIT 4")
	.reduce(function(rows, row){
		return rows.append(row);
	}, [])
;
writeDump(numbersAsArray);
</cfscript>