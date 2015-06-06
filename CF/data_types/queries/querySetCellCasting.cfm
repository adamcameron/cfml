<cfscript>
	q1 = queryNew("strValue");
	queryAddRow(q1);
	querySetCell(q1, "strValue", "9-3");

	q2 = queryNew("strValue", "varchar");
	queryAddRow(q2);
	querySetCell(q2, "strValue", "9-3");

	q3 = queryNew("strValue", "varchar");
	queryAddRow(q3);
	querySetCell(q3, "strValue", javacast("string", "9-3"));
</cfscript>

<cfquery name="q3" dbtype="query">
	select * from q1
</cfquery>

<cfquery name="q4" dbtype="query">
	select * from q2
</cfquery>

<cfquery name="q6" dbtype="query">
	select * from q3
</cfquery>

<cfdump var="#variables#">