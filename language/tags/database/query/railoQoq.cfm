<cfscript>
// railoQoq.cfm

numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one", "tahi"],
	[2,"two", "rua"],
	[3,"three", "toru"],
	[4,"four", "wha"]
]);


query name="number" dbtype="query" {
	writeOutput("
		SELECT	*
		FROM	numbers
		WHERE	id = 
	");
	queryparam value=randRange(1,numbers.recordCount) cfsqltype="CF_SQL_INTEGER";
}
writeDump(var=variables);
</cfscript>