<cfcomponent output="false">
	
	<cfset this.name = "app1">


	<cffunction name="onRequest" returnType="void">
		<cfargument name="thePage" type="string" required="true">
		
		<cfset variables.foo = "bar">
		
		<cfinclude template="#arguments.thePage#">
	</cffunction>


</cfcomponent>