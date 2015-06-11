<cfscript>
	q1 = queryNew("col1,col2");
	queryAddRow(q1); querySetCell(q1, "col1", 1);  querySetCell(q1, "col2", "a"); 
	queryAddRow(q1); querySetCell(q1, "col1", 2);  querySetCell(q1, "col2", "b"); 
	queryAddRow(q1); querySetCell(q1, "col1", 3);  querySetCell(q1, "col2", "c"); 
</cfscript>

<cfsavecontent variable="s">
	<cfdump var="#q1#" label="q1">
	<cfquery name="q2" dbtype="query">
		select	*
		from	q1
	</cfquery>
	<cfdump var="#q2#" label="q2">
</cfsavecontent>

<cfoutput>#s#</cfoutput>