<!--- return.cfm --->
<cffunction name="returnGreeterFunction">
	<cfargument name="greeting" type="string" required="true">
	<cfreturn function(name){return '#greeting#, #name#'}>
</cffunction>

<cfset fn = returnGreeterFunction("G'day")>
<cfoutput>#fn("Zachary")#</cfoutput>