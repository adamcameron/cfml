<!--- C.cfc --->

<cfcomponent>
	
	<cffunction name="callFunctionWith">
		<cfargument name="name" type="string" required="true">
		<cfargument name="fn" type="function" required="true">
		<cfoutput>#fn(name)#</cfoutput>
	</cffunction>

</cfcomponent>