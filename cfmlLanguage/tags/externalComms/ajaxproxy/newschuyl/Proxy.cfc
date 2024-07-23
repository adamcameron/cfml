<cfcomponent output="false">

	<!--- Gets the server date and time --->
	<cffunction name="serverTime" access="remote" returntype="string" output="false">
		<cfset var local = {}>

		<cfset local.time = now()>
		<cfset local.result = dateFormat(local.time, "dd mmm yyyy") & " - " & timeFormat(local.time, "HH:mm:ss")>

		<cfreturn local.result>
	</cffunction>

	<!--- Reverses passed string --->
	<cffunction name="reverseString" access="remote" returntype="string" output="false">
		<cfargument name="source" type="string" required="true">

		<cfreturn reverse(arguments.source)>
	</cffunction>

</cfcomponent>