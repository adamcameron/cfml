<cfcomponent output="false">
	
	
	<cfset this.name = "locateOnError">

	
	<cffunction name="onError" returnType="void" output="false">
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">
		
		<cflocation url="./blocked/target.cfm?message=#arguments.exception.message#&detail=#arguments.exception.detail#" addtoken="false">


	</cffunction>

</cfcomponent>