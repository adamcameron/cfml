<cfif structKeyExists(thistag, "breakAttributes") and thistag.breakAttributes[1].break>
	<cfset thistag.generatedContent = "">
	<cfexit method="exittag">
</cfif>

<cfif (THISTAG.ExecutionMode EQ "Start")>

	<cfparam name="attributes.index" type="variablename">
	<cfparam name="attributes.iterations" type="integer">

	<cfset variables.index = 1>
	<cfset caller[attributes.index] = variables.index>
<cfelse>
	<cfset variables.index = variables.index + 1>
	<cfif variables.index lte attributes.iterations>
		<cfset caller[attributes.index] = variables.index>
		<cfexit method="loop">
	<cfelse>
		<cfexit method="exittag">
	</cfif>

</cfif>