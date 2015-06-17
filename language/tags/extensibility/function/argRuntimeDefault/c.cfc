<cfcomponent output="false">

	<cfset variables.instance = structNew()>

	<cffunction name="processMyString" returntype="string" output="false" access="public">
		<cfargument name="myString" required="false" default="#variables.instance.myString#">
		<cfreturn "PROCESSED: " & arguments.myString>
	</cffunction>


	<cffunction name="setMyString" returntype="void" output="false" access="public">
		<cfargument name="myString" type="string" required="true">
		<cfset variables.instance.myString = arguments.myString>
		<cfreturn>
	</cffunction>


	<cffunction name="getVariables" returntype="struct" output="false" access="public">
		<cfreturn variables.instance>
	</cffunction>

</cfcomponent>