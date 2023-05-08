<cfscript>
	st = structNew();
	st["1. now()"] = now();
	st["2. now()+1"] = now() + 1;
	st["3. createOdbcDate(now()+1)"] = createOdbcDate(now()+1);
</cfscript>

<cfdump var="#st#">