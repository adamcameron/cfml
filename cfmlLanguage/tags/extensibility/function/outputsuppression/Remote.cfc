<!--- Remote.cfc --->
<cfcomponent output="false">
	

	<cffunction name="execute" returntype="string" access="remote" output="false" returnformat="plain">
		<cfargument name="component" type="string" required="true">
		<cfargument name="methodToRun" type="string" required="false">
		<cfargument name="argumentCollection" type="struct" required="false" default="#{}#">
		
		<cfset var o = createObject(component)>
		<cfset var metadata = getMetadata(o)>
		<cfset var response = "">
		<cfloop index="function" array="#metadata.functions#">
			<cfinvoke component="#component#" method="#function.name#" argumentcollection="#argumentcollection#" returnvariable="local.result">
			<cfoutput>#local.result#</cfoutput>
			<cfset response &= (result ? '<span style="background-color:GREEN;color:white">PASS</span>' : '<span style="background-color:red;color:white">FAIL</span>') & "<br>">
		</cfloop>
		<cfreturn response>
	</cffunction>

</cfcomponent>

