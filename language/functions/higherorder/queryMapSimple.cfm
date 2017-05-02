<cfscript>
numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"]
]);
remapTemplate = queryNew("value,english,maori", "integer,varchar,varchar", [
	[5, "five", "rima"]
]); 

reMapped = numbers.map(function(row){
	return {value=row.id, english=row.en, maori=row.mi};
}, remapTemplate);

writeDump(reMapped);
writeOutput("<br><br>");
writeDump(remapTemplate);
</cfscript>