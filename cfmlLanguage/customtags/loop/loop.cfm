<!--- loop.cfm --->
<cfif (THISTAG.ExecutionMode EQ "Start")>
	<cfoutput>START<br></cfoutput>
	<cfparam name="attributes.index" type="variablename">
	<cfparam name="attributes.iterations" type="integer">
 
	<cfset variables.index = 1>
	<cfset caller[attributes.index] = variables.index>
<cfelse>
	<cfoutput>END<br></cfoutput>
	<cfset variables.index = variables.index + 1>
	<cfif variables.index gt attributes.iterations>
		<cfexit method="exittag">
	<cfelse>
		<cfset caller[attributes.index] = variables.index>
		<cfexit method="loop">
	</cfif>
</cfif>