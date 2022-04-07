<cfscript>
// query.cfm

numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one", "tahi"],
	[2,"two", "rua"],
	[3,"three", "toru"],
	[4,"four", "wha"]
]);

number = new Query(
	dbtype	= "query",
	numbers	= numbers,
	sql		= "
		SELECT	*
		FROM	numbers
		WHERE	id = :ID
	",
	parameters	= [
		{name="ID", value=randRange(1,numbers.recordCount), cfsqltype="CF_SQL_INTEGER"}
	]
).execute().getResult();

writeDump(var=variables);
</cfscript>