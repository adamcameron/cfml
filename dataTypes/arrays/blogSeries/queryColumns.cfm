<cfscript>
data = queryNew(
	"id,english,maori",
	"integer,varchar,varchar", 
	[
		[1, "one", "tahi"],
		[2, "two", "rua"],
		[3, "three", "toru"],
		[4, "four", "wha"]
	]
);

writeOutput("Data type of a query column: " & data["english"].getClass().getName() & "<br />");

writeDump(data);
writeOutput("isArray(): " & isArray(data["english"]) & "<br />");

writeOutput('Because writeDump() can take a string, CF will interpret data["english"] as a string in this situation: ');
writeDump(data["english"]);
writeOutput("<hr />");
writeOutput("Use arrayEach() to iterate over a query column:<br />");
arrayEach(
	data["english"],
	function(element){
		writeOutput(element & "<br />");
	}
);
</cfscript>