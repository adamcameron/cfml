<cfparam name="attributes.query" type="query">
<cfparam name="attributes.index" type="variableName">

<cfif not structKeyExists(variables, "counter")>
	<cfset counter = 1>
</cfif>

<cfif thisTag.executionMode is "start">
	<cfset caller[attributes.index] = counter>
	<table border="1"><tr>
<cfelse>
	<cfset counter = counter + 1>
	<cfset caller[attributes.index] = counter>
	<cfif counter lte attributes.query.recordCount>
		</tr><tr>
		<cfexit method="loop">
	<cfelse>
		</tr>
	</cfif>
	</table>
</cfif>
