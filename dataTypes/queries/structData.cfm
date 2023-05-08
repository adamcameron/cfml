<cfscript>
	s = structNew();
	s.k1 = "key1";
	
	q = queryNew("s", "data");
	queryAddRow(q);
	querySetCell(q, "s", s);
</cfscript>

<cfdump var="#getMetaData(q)#">