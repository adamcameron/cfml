<cfscript>
	q = queryNew("col");
	for (i=1; i le 5; i=i+1){
		queryAddRow(q);	querySetCell(q, "col", i);
	}
	
	o = createObject("component", "c");
</cfscript>
<cfoutput query="q">
	#o.f(q)#<br />
</cfoutput>
<cfoutput>
	<cfset q.currentRow = 3>
	#o.f(q)#<br />
</cfoutput>