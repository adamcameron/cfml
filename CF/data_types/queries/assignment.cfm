<cfscript>
	q = queryNew("col");
	queryAddRow(q);
	q["col"][1] = "foo";
</cfscript>

<cfdump var="#q#">