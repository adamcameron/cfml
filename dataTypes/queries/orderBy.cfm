<cfscript>
	q1 = queryNew("intCol");
	for (i=1; i le 20; i=i+1){
		queryAddRow(q1); querySetCell(q1, "intCol", "0" & randRange(0,999));
	}
</cfscript>
<cfquery name="q2" dbtype="query">
	select		cast(intCol as integer) as intCol
	from		q1
	order by	intCol
</cfquery>

<cfdump var="#q2#">