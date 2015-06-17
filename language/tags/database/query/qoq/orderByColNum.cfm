<cfscript>
	q1 = queryNew("col1,col2,col3");
	queryAddRow(q1); querySetCell(q1, "col1", 1); querySetCell(q1, "col2", 'one');  querySetCell(q1, "col3", "un");
	queryAddRow(q1); querySetCell(q1, "col1", 2); querySetCell(q1, "col2", 'two');  querySetCell(q1, "col3", "deux");
	queryAddRow(q1); querySetCell(q1, "col1", 3); querySetCell(q1, "col2", 'three');  querySetCell(q1, "col3", "trois");
</cfscript>

<cfquery name="q2" dbtype="query">
	select		*
	from		q1
	order by	1 desc
</cfquery>
<cfdump var="#q2#" label="col1 ordered 3,2,1">

<cfquery name="q3" dbtype="query">
	select		col3, col2, col1
	from		q1
	order by	1 desc
</cfquery>
<cfdump var="#q3#" label="col3 ordered un, trois, deux">

<cfquery name="q4" dbtype="query">
	select		col3, col2, col1
	from		q1
	order by	2 desc
</cfquery>
<cfdump var="#q4#" label="col2 ordered two, three, one">