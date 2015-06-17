<cfscript>
	s = structNew();
	s.i = 1;
	q = queryNew("stringData,structData");
	queryAddRow(q);
	querySetCell(q, "stringData", "string");
	querySetCell(q, "structData", s);
</cfscript>

<cfquery name="qoq" dbtype="query">
	select	stringData
	from	q
</cfquery>

<cfdump var="#qoq#">