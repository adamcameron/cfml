<cfscript>
	q1 = queryNew("c");
	queryAddRow(q1);
	querySetCell(q1, "c", " leading space");
</cfscript>
<cfquery name="q2" dbtype="query">
	select	*
	from	q1
</cfquery>
<cfoutput>
"#q1.c[1]#"<br />
"#q2.c[1]#"<br />
</cfoutput>

<cfquery name="q3" datasource="junk">
	select	*
	from	Table1
</cfquery>
<cfquery name="q4" dbtype="query">
	select	*
	from	q3
</cfquery>
<hr />
<cfoutput query="q3">
	[#id_col#][#space_col#]<br />
</cfoutput>
<hr />
<cfoutput query="q4">
	[#id_col#][#space_col#]<br />
</cfoutput>
