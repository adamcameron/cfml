<cfcomponent>
<!--- 	<cfdump var="#variables#" label="Constructor"> --->

	<cffunction name="fmod" output="true" returntype="query">
		<cfargument name="match" type="string" required="yes">
		<cfset var q = queryNew("")>
		<cfset var fromModule = false>
		<cfdump var="#variables#" label="Before module">
		<cfquery name="q" datasource="tq_com" maxrows="5">
			select		*
			from		pages
			<cfmodule template="mod.cfm" attributecollection="#arguments#">
		</cfquery>
		<cfdump var="#variables#" label="After module">
		<cfreturn q>
	</cffunction>

	<cffunction name="finc" output="true" returntype="query">
		<cfargument name="match" type="string" required="yes">
		<cfset var q = queryNew("")>
		<cfdump var="#variables#" label="Before include">
		<cfquery name="q" datasource="tq_com" maxrows="5">
			select		*
			from		pages
			<cfinclude template="inc.cfm">
		</cfquery>
		<cfdump var="#variables#" label="After include">
		<cfreturn q>
	</cffunction>


	<cffunction name="fmod2" output="true" returntype="void">
		<cfargument name="match" type="string" required="yes">
		<cfset var local = false>
		<cfset var local2 = false>
		<cfset var local3 = false>
		<cfset variables.component = false>
		<cfmodule template="mod2.cfm" vars="#getPageContext().getActiveFunctionLocalScope()#">
		<cfdump var="#getPageContext().getActiveFunctionLocalScope()#" label="FUNCTION: local vars">
	</cffunction>

</cfcomponent>