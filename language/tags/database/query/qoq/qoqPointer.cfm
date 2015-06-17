<cfscript>
	q = queryNew("col1,col2");
	for (i=1; i le 5; i=i+1){
		queryAddRow(q);
		querySetCell(q, "col1", "init-r#i#-col1");
		querySetCell(q, "col2", "init-r#i#-col2");
	}
</cfscript>

<cfquery name="q2" dbtype="query">
	select	col1, col2
	from	q
	where	col1 = 'init-r3-col1'
</cfquery>
<cfset querySetCell(q2, "col1", "updated-r1-col1")>
<cfset querySetCell(q2, "col2", "updated-r1-col2")>

<cfdump var="#q#">
<cfdump var="#q2#">