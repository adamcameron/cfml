<cfscript>
	stringArray = arrayNew(1);
	arraySet(stringArray, 1, 5, "stringdata");

	q = queryNew("");
	queryAddColumn(q, "firstCol",stringArray);
</cfscript>
<cfdump var="#q#">

<cfscript>
	stringArray = arrayNew(1);
	stringArray[5] = "stringData";

	q = queryNew("");
	queryAddColumn(q, "firstCol", stringArray);
</cfscript>
<cfdump var="#q#">
<cfdump var="#q.firstCol[2]#">
<cfquery name="qoq" dbtype="query">
	select	*
	from	q
</cfquery>
<cfdump var="#qoq#">

<cfscript>
	stringArray = arrayNew(1);
	stringArray[5] = structNew();

	q = queryNew("");
	queryAddColumn(q, "firstCol", stringArray);
</cfscript>
<cfdump var="#q#">
