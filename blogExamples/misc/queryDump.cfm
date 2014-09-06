<cfscript>
numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
[1,"one", "tahi"],
[1,"two", "rua"],
[3,"three", "toru"],
[4,"four", "wha"]
]); 
evens = queryExecute(
	"SELECT * FROM numbers WHERE id IN (:evens)",
	{ evens = { value = "2,4", list = true, cfsqltype = "CF_SQL_INTEGER" } },
	{dbtype="query", numbers=numbers}
);

writedump(evens);

// RAILO: SELECT * FROM numbers WHERE id IN ('2,4') 
// CF11: SELECT * FROM numbers WHERE id IN (?) // (where ? = "2,4")
</cfscript>
