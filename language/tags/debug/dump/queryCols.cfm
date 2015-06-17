<cfscript>
	q1 = queryNew("colZ,Col2,ColA", "varchar,varchar,varchar");
	queryAddRow(q1);
	querySetCell(q1, "colZ", 1);
	querySetCell(q1, "col2", 2);
	querySetCell(q1, "colA", 3);

	queryAddRow(q1);
	querySetCell(q1, "colZ", "A");
	querySetCell(q1, "col2", "B");
	querySetCell(q1, "colA", "C");
</cfscript>
<cfdump var="#q1#" label="q1">

<cfquery name="q2" dbtype="query">
	select	*
	from	q1
</cfquery>
<cfdump var="#q2#" label="q2">
<cfdump var="#getMetadata(q2)#" label="getMetadata(q2)">