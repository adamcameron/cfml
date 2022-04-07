<cfcomponent>

	<cfset variables.cfc = "Before">

	<cffunction name="f" output="true" returntype="boolean">
		<cfset var func = "Before">

		<cfdump var="#variables#" label="Variables Before">
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="Vars Before">

		<cfinclude template="./inc.cfm">

		<cfdump var="#variables#" label="Variables After">
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="Vars After">

		<cfreturn true>
	</cffunction>

</cfcomponent>