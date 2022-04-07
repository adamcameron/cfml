<cfcomponent>


	<cffunction name="f" access="public" returntype="boolean" output="false" hint="f()'s hint.">
		<cfargument name="b" type="boolean" required="true" hint="A boolean arg">
		<cfreturn not arguments.b>
	</cffunction>
	
	
</cfcomponent>