<cffunction name="f">
	<cfargument name="arg1" returntype="function">
	<cfreturn arguments.arg1()>
</cffunction>

<cffunction name="g">
	<cfreturn "gee!">
</cffunction>

<cfoutput>#f(arg1=g)#</cfoutput>