<cfcomponent>
	
	<cffunction name="onCfcRequest" returntype="void">
		<cfargument type="string" name="cfcname"> 
		<cfargument type="string" name="method"> 
		<cfargument type="struct" name="args"> 
		<cfdump var="#arguments#">
	</cffunction>
	
</cfcomponent>