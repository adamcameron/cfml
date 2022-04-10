<cfcomponent name="StateGateway" access="public" hint="Gateway for states">

 <!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="init" output="false" returntype="any" hint="instantiates an object of this class" access="public">
	<cfargument name="dns" required="true" type="any">
	
		<cfset variables.dsn = arguments.dns>
		<cfreturn this />
</cffunction>

<!--- :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: --->
<cffunction name="getAll" output="false" hint="Gets all the records" access="public" returntype="query">

	<cfset var q_state = "" />
	
	<cfquery name="q_state" datasource="#variables.dsn#" cachedWithin="#CreateTimeSpan(0,2,0,0)#">
		SELECT	state.*
		FROM	state
		ORDER BY name
	</cfquery>

	<cfreturn q_state />
</cffunction>

</cfcomponent>