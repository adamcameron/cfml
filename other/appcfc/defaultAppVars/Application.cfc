<cfcomponent>
	
	<cfset this.name = createUuid()>
	
	
	<cffunction name="onRequestStart">
		<cfdump var="#this#" label="this in onRequestStart()">
		<cfdump var="#application#" label="application in onRequestStart()">
	</cffunction>
	
</cfcomponent>