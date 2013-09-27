Content before<br>
<cfset msg = "Content within">
<cf_explicitOutput>
	<cfoutput>#msg#</cfoutput><br>
</cf_explicitOutput>
Content after<br>

<cfdump var="#variables#">