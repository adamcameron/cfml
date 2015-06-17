<!--- CViaTags.cfc --->
<cfcomponent output="false">

	<cfset variables.myProperty = "">

	<cffunction access="public" returntype="void" name="setMyProperty" output="false">
		<cfargument required="true" type="string" name="myProperty">	
		<cfset variables.myProperty = arguments.myProperty>
	</cffunction>

	<cffunction access="public" returntype="string" name="getMyProperty" output="false">
		<cfreturn variables.myProperty>
	</cffunction>
	
</cfcomponent>