<cfset o = getPageContext().getActiveFunctionLocalScope()>

<cfif isDefined("o")>
	<cfdump var="#o#" label="VARs">
<cfelse>
	<cfdump var="#variables#" label="variables">
</cfif>

<cfoutput>[#isStruct(getPageContext().getActiveFunctionLocalScope())#]</cfoutput>