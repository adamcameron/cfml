<cfset q0 = queryNew("col0")>
<cfset queryAddRow(q0)>
<cfset querySetCell(q0, "col0", "eine")>
<cfset queryAddRow(q0)>
<cfset querySetCell(q0, "col0", "zwei")>
<cfwddx action="cfml2wddx" input="#q0#" output="w0">
<cfoutput>
#htmlEditFormat(w0)#<br /><br />
</cfoutput>


<cfset q1 = queryNew("col1")>
<cfset queryAddRow(q1)>
<cfset querySetCell(q1, "col1", 1)>
<cfset queryAddRow(q1)>
<cfset querySetCell(q1, "col1", 2)>
<cfwddx action="cfml2wddx" input="#q1#" output="w1">
<cfoutput>
#htmlEditFormat(w1)#<br /><br />
</cfoutput>

<cfset q2 = queryNew("col2")>
<cfset queryAddRow(q2)>
<cfset querySetCell(q2, "col2", "one")>
<cfset queryAddRow(q2)>
<cfset querySetCell(q2, "col2", "two")>
<cfwddx action="cfml2wddx" input="#q2#" output="w2">
<cfoutput>
#htmlEditFormat(w2)#<br /><br />
</cfoutput>


<cfquery name="q3" dbtype="query">
	select	*
	from	q1, q2, q0
</cfquery>
<cfwddx action="cfml2wddx" input="#q3#" output="w3">
<cfdump var="#q3#">
<cfoutput>
#htmlEditFormat(w3)#
</cfoutput>
