<cfset iMax = 10>
<cfset iCount = 1>

<cfloop condition="iCount le #iMax / 2#">
	<cfoutput>[#iCount#]<br /></cfoutput>
	<cfset iCount = iCount + 1>
</cfloop>