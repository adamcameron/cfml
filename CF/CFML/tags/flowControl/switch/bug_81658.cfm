<cfset TestVar = "FR">

<cfswitch expression="#TestVar#">
	<cfcase value='G3'>
		<cfoutput>G3 = #TestVar#</cfoutput>
	</cfcase>
	<cfcase value='FR'>
		<cfoutput>FR = #TestVar#</cfoutput>
	</cfcase>
	<cfdefaultcase>
		<cfoutput>TestVar = #TestVar#</cfoutput>
	</cfdefaultcase>
</cfswitch>

<cfif TestVar eq 'G3'>
	<cfoutput>G3 = #TestVar#</cfoutput>
<cfelseif TestVar eq 'FR'>
	<cfoutput>FR = #TestVar#</cfoutput>
<cfelse>
	<cfoutput>TestVar = #TestVar#</cfoutput>
</cfif>


