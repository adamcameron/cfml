<cfcomponent>
	<cffunction name="f1">
		<cfargument name="arg1" type="struct">
		<cfargument name="arg2" type="string">
		
		<cfset arg1.newKey = "Struct Key From f1()">
		<cfset arg2 = "String From f1()">
		<cfset f2(argumentCollection=arguments)>
	</cffunction>
	
	<cffunction name="f2" output="true">
		<cfargument name="arg1">
		<cfdump var="#arguments#">
	</cffunction>

</cfcomponent>