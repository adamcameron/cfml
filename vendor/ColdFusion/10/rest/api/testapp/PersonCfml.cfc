<cfcomponent rest="true">

	<cffunction
		name		= "getPerson"
		access		= "remote"
		returntype	= "query"
		httpmethod	= "GET"
		restpath	= "getPerson"
		produces	= "text/xml"
		consumes	= "text/plain"
		hint		= "Returns a message"
	>
		<cfargument
			name			= "message"
			type			= "string"
			required		= "false"
			default 		= "#createUuid()#"
			restargsource	= "query"
			hint			= "A message to return"
		>
		<cfreturn queryNew("")>
	</cffunction>

</cfcomponent>