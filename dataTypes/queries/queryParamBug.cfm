<cfscript>
	base = queryNew("col1");
	for (i=1; i le 3; i=i+1){
		queryAddRow(base);	querySetCell(base, "col1", "My favourite letter is '#chr(64+i)#'");
	}
</cfscript>
<cfdump var="#base#">

<cfquery name="test" dbtype="query">
	select	*
	from	base
	where col1 = <cfqueryparam value="#base.col1[2]#" cfsqltype="CF_SQL_VARCHAR">
</cfquery>
<cfdump var="#test#">