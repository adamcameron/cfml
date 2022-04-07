<cfcomponent>
	<cfset variables.cfclevel = true>
	<cfdump var="#variables#" label="C">
	
	<cffunction name="f1">
		<cfset variables.f1level = true>
		<cfdump var="#variables#" label="f1">
	</cffunction>
	
	<cffunction name="f2">
		<cfset variables.f2level = true>
		<cfdump var="#variables#" label="f2">
	</cffunction>

</cfcomponent>