<cfscript>
baseNumbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"]
]);
numbers = duplicate(baseNumbers);
remapTemplate = queryNew("value,english,maori"); 

reMapped = numbers.map(function(row){
	return {value=row.id, english=row.en, maori=row.mi};
}, remapTemplate);

queryWithDifferentColumns = queryNew("value,english,maori", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"]
]);

writeDump(variables);
</cfscript>