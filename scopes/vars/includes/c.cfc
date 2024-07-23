<cfcomponent>



	<cffunction name="f" output="true">
		<cfset var stVars = structNew()>
		<cfset stVars.inFunction = true>
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() before include">
		<cfdump var="#variables#" label="variables before include">

		<cfinclude template="./i.cfm">

		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="getPageContext().getActiveFunctionLocalScope() after include">
		<cfdump var="#variables#" label="variables after include">
	</cffunction>
	
</cfcomponent>