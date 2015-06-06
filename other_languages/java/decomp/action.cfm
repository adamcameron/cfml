<cfdump var="#form#">
<cfset count=arrayLen(form.txtData)>
<cfif form.mode EQ "cfloop">
	<cfinclude template="./cfloop.cfm">
<cfelse>
	<cfinclude template="./cfscript.cfm">
</cfif>