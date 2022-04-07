<cfparam name="attributes.from" type="numeric">
<cfparam name="attributes.to" type="numeric">
<cfparam name="attributes.index" type="variableName">

<cfif not isDefined("counter")>
	<cfset counter = attributes.from>
</cfif>

<cfif thisTag.executionMode is "start">

	<cfset caller[attributes.index] = counter>
	
<cfelse>

	<cfset counter = counter + 1>
	<cfset caller[attributes.index] = counter>
	
	<cfif counter lte attributes.to>
		<cfexit method="loop">
	</cfif>
	
</cfif>