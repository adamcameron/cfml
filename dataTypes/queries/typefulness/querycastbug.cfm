<cfset q1 = queryNew("col")>
<cfloop index="i" from="1" to="3">
	<cfset queryAddRow(q1)>
	<cfset querySetCell(q1, "col", i)>
</cfloop>
<cfwddx action="cfml2wddx" input="#q1#" output="wddxQ">
<cfoutput>#htmlEditFormat(tostring(wddxQ))#</cfoutput>

<hr />

<cfscript>
	q1 = queryNew("col");
	
	for (i = 1; i le 3; i=i+1){
		queryAddRow(q1);
		querySetCell(q1, "col", i);
	}
</cfscript>
<cfwddx action="cfml2wddx" input="#q1#" output="wddxQ">
<cfoutput>#htmlEditFormat(tostring(wddxQ))#</cfoutput>
