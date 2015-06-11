<cfscript>
	q = queryNew("col1");
	queryAddRow(q); querySetCell(q, "col1", "red");
	queryAddRow(q); querySetCell(q, "col1", "green");
	queryAddRow(q); querySetCell(q, "col1", "blue");
</cfscript>

<cfquery name="qCount1" dbtype="query">
	select	count(col1) as colCount
	from	q
	where	col1 = 'red'
</cfquery>
<cfdump var="#qCount1#">

<cfquery name="qCount1" dbtype="query">
	select	count(col1) as colCount
	from	q
	where	col1 = 'orange'
</cfquery>
<cfdump var="#qCount1#">