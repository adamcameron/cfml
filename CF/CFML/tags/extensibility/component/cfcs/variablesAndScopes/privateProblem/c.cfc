<!--- c.cfc --->
<cfcomponent>
	<cffunction name="f">
		<cfreturn p()>
	</cffunction>

	<cffunction name="p">
		<cfreturn "private!">
	</cffunction>
</cfcomponent>