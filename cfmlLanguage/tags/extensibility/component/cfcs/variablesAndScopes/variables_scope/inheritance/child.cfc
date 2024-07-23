<!--- child.cfc --->
<cfcomponent extends="parent">
	<cfset variables.child = true>
	
	<cffunction name="get">
		<cfreturn variables>
	</cffunction>
</cfcomponent>