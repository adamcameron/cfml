<cfscript>
	q = queryNew("1,2,3");
	queryAddRow(q);
	querySetCell(q, "1", "one");
	querySetCell(q, "2", "two");
	querySetCell(q, "3", "three");
	queryAddRow(q);
	querySetCell(q, "1", "un");
	querySetCell(q, "2", "deux");
	querySetCell(q, "3", "trois");
</cfscript>

<cfdump var="#q#">

<cfquery name="qEn" dbtype="query">
	select	*
	from	q
	where	[1] = 'one'
</cfquery>

<cfdump var="#qEn#">