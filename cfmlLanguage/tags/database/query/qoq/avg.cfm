<cfscript>
	q = queryNew("data");
	queryAddRow(q);	querySetCell(q, "data", 1);
	queryAddRow(q);	querySetCell(q, "data", 2);
	queryAddRow(q);
	queryAddRow(q);	querySetCell(q, "data", 4);
	queryAddRow(q);	querySetCell(q, "data", 5);
</cfscript>
<cfquery name="q2" dbtype="query">
	select	data
	from	q
	where	data is not null
</cfquery>
<cfquery name="q3" dbtype="query">
	select	avg(data) as avgData
	from	q2
</cfquery>
<cfdump var="#q3#">