<cfcomponent rest="true">

	<cffunction
		name		= "ping"
		access		= "remote"
		returntype	= "string"
		httpmethod	= "GET"
		restpath	= "ping/{message}"
		produces	= "text/plain"
		consumes	= "text/plain"
		hint		= "Returns a message"
	>
		<cfargument
			name			= "message"
			type			= "string"
			required		= "false"
			default 		= "#createUuid()#"
			restargsource	= "path"
			hint			= "A message to return"
		>
		<cfset var sMessage = arguments.message & " received at #now()#">
		<cflog file="testRest" text="#sMessage#">
		<cfreturn sMessage>
	</cffunction>
	
	<cffunction name="getOptions" access="remote" restpath="getOptions" returntype="string" httpmethod="options">
		<cfset var sMessage = "getOptions() called at #now()#">
		<cflog file="testRest" text="#sMessage#">
		<cfreturn sMessage>
	</cffunction>

</cfcomponent>