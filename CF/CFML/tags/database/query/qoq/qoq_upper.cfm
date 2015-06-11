<cfscript>
	base = queryNew("col1");
	for (i=1; i le 10; i=i+1){
		queryAddRow(base);
		querySetCell(base, "col1", chr(64+i));
	}
//		queryAddRow(base);
</cfscript>

<cfdump var="#base#">

<cfquery name="test" dbtype="query">
	select	lower(col1)
	from	base
	where lower(col1) = '#lCase("A")#'
</cfquery>

<cfdump var="#test#">