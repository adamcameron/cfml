<cfcomponent>
	<cffunction name="duplicateIssue" access="public" output="false" returntype="void" hint="">
		<cfargument name="arg1" type="string" required="true" hint="">
		<cfargument name="arg2" type="string" required="true" hint="">
		<cfargument name="arg3" type="string" required="true" hint="">
		 <cfset var local			= duplicate(arguments)> 
		<cfset var local2			= duplicate(arguments)>
		<!--- <cfset local				= duplicate(arguments)>--->
		<cfdump var="#local#" label="local after"> 
		<cfdump var="#local2#" label="local 2">
		<cfabort>
	</cffunction>
</cfcomponent>