<!--- c2.cfc --->
<cfcomponent>
	<cffunction name="g">
		<cfargument name="func" type="any">
		<cfreturn arguments.func()>
	</cffunction>
</cfcomponent>