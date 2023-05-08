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

numbersAsArray = queryExecute("SELECT * FROM numbers", [], {dbtype="query", numbers=numbers})
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

writeDump({
	numbers=numbers,
	numbersAsArray=numbersAsArray
});
</cfscript>