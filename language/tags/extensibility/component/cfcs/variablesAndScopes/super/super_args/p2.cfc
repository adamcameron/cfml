<!--- parent.cfc --->
<cfcomponent>
	<cffunction name="f">
		<cfargument name="a1" required="yes">
		<cfargument name="a2" required="yes">
		
		PARENT<br />
		<cfdump var="#arguments#" label="Parent Args">
		
		<cfreturn true>
	</cffunction>
</cfcomponent>
