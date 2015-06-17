<cfscript>
	q1 = queryNew("col1,col2");

	for (i=1; i le 25; i=i+1){
		queryAddRow(q1);
		querySetCell(q1, "col1", i);
		querySetCell(q1, "col2", chr(65+(i mod 5)));
	}

</cfscript>
<cfdump var="#q1#">

<cfoutput query="q1" group="col2">
	[#col1#][#col2#]<br />
</cfoutput>

<cfquery name="q2" dbtype="query">
	select		*
	from		q1
	order by	col2
</cfquery>
<hr />
<cfoutput query="q2" group="col2">
	[#col1#][#col2#]<br />
</cfoutput>
