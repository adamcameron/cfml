<cfscript>
	q1 = queryNew(""); queryAddRow(q1);
	q2 = queryNew("col1,col2");
	queryAddRow(q2);	querySetCell(q2, "col1", "A");	querySetCell(q2, "col2", "alpha");
	queryAddRow(q2);	querySetCell(q2, "col1", "B");	querySetCell(q2, "col2", "bravo");
	queryAddRow(q2);	querySetCell(q2, "col1", "C");	querySetCell(q2, "col2", "charlie");
</cfscript>

<cfquery name="q3" dbtype="query">
	select	distinct *
	from	q1,q2
</cfquery>

<cfdump var="#q3#">