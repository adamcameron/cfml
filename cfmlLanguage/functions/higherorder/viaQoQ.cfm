<cfscript>
numbers = queryExecute("SELECT * FROM numbers");
numbersAsArray = queryExecute("
	SELECT id AS `value`, en AS english, mi AS maori
	FROM numbers
	WHERE id > 5
	ORDER BY id DESC
", [], {dbtype="query", numbers=numbers})
	.reduce(function(rows, row){
		return rows.append(row);
	}, []);

writeDump(numbersAsArray);
</cfscript>