<cfscript>
	include "makeQuery.cfm";
	one = new Query(
		dbtype	= "query",
		SQL		= "SELECT * FROM numbers WHERE id = 1",
		numbers	= numbers
	).execute().getResult();
	writeDump(one);
</cfscript>