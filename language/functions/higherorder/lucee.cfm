<cfscript>
numbers = queryExecute("SELECT * FROM numbers")
	.map(function(row){
		return {value=row.id, english=row.en, maori=row.mi};
	}, queryNew("value,english,maori"))
	.filter(function(row){
		return row.value > 5;
	})
	.sort(function(e1,e2){
		return e2.value - e1.value;
	})
	.reduce(function(rows, row){
		return rows.append(row);
	}, [])
;

writeDump(numbers);
</cfscript>