<cfscript>
	a = arrayNew(1);
	arrayAppend(a, queryNew("col"));
	queryAddRow(a[1]);	a[1].col[1] = "foo";
	queryAddRow(a[1]);	a[1].col[2] = "bar";

	q = a[1];
</cfscript>

<cfoutput query="#q#">
	#col#
</cfoutput>
