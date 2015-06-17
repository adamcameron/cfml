<cffunction name="f">
	<cfargument name="u" type="guid">
	<cfreturn arguments.u>
</cffunction>

<cfoutput>[#f(u=createUuid())#]</cfoutput>