<cfcomponent extends="c">
	<cfset variables.c2level = true>
	<cfdump var="#variables#" label="C2">
	
	<cffunction name="f3">
		<cfset variables.f3level = true>
		<cfdump var="#variables#" label="f3">
	</cffunction>
</cfcomponent>