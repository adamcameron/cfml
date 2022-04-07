<cfscript>
	q1 = queryNew("col1,col2");
	queryAddRow(q1); querySetCell(q1, "col1", "Adam"); querySetCell(q1, "col2", "Cameron");
	queryAddRow(q1); querySetCell(q1, "col1", "Miriama"); querySetCell(q1, "col2", "Mahuika");
	queryAddRow(q1); querySetCell(q1, "col1", "John"); querySetCell(q1, "col2", "Corbett");
</cfscript>

<cfquery name="q2" dbtype="query">
	select		col1, col2, lower(col1) as lower_col1, upper(col2) as upper_col2
	from		q1
	order by	lower_col1, upper_col2
</cfquery>

<cfdump var="#q2#">