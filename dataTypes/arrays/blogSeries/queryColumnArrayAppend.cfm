<cfscript>
query = queryNew(
	"id,english,maori",
	"integer,varchar,varchar", 
	[
		[1, "one", "tahi"],
		[2, "two", "rua"],
		[3, "three", "toru"],
		[4, "four", "wha"]
	]
);

array = ["rima","ono","whitu","waru","iwa","tekau"];

arrayAppend(query["maori"], array, true);
writeDump(variables);
</cfscript>