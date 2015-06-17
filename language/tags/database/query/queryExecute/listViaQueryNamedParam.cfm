<cfscript>
numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
[1,"one", "tahi"],
[2,"two", "rua"],
[3,"three", "toru"],
[4,"four", "wha"]
]); 
evens = new Query(
	sql			= "SELECT * FROM numbers WHERE id IN (:evens)",
	parameters	= [{name="evens",value="2,4", list=true, cfsqltype="CF_SQL_INTEGER"}],
	dbtype		= "query",
	numbers		= numbers
).execute().getResult();

writedump(evens);

</cfscript>
