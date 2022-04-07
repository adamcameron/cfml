<cfscript>
	q1 = queryNew("col1");
	q2 = queryNew("col2");

	for (i=1+0; i le 10; i=i+1){
		queryAddRow(q1); querySetCell(q1, "col1", i);
		if (i gt 3 and i lt 7){
			queryAddRow(q2); querySetCell(q2, "col2", i);
		}
	}
</cfscript>

<cfquery name="q3" dbtype="query">
	select	*
	from	q1
	where	col1 in (4,5,6)

</cfquery>