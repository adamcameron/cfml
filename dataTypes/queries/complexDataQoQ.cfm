<cfscript>
	a = listToArray("a,b,c,d,e");

	q = queryNew("pkCol,simpleDataCol,complexDataCol");
	queryAddRow(q);
	querySetCell(q, "pkCol", q.recordCount);
	querySetCell(q, "simpleDataCol", "Adam");
	querySetCell(q, "complexDataCol", a);
</cfscript>
<cfdump var="#q#">
<cfquery name="q2" dbtype="query">
	select	pkCol
	from	q
</cfquery>
<cfdump var="#q2#">
