<cfscript>
	q = queryNew("complex", "binary");
	queryAddRow(q);
	querySetCell(q, "complex", structNew());
</cfscript>
<cfdump var="#q#">