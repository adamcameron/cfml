<!--- argument.cfm --->
<cffunction name="greeter">
	<cfargument name="name" type="string" required="true">
	<cfargument name="fn" type="function" default="#function(name){return 'G''day, #name#'}#">

	<cfreturn fn(name)>
</cffunction>

<cfoutput>#greeter("Zachary")#</cfoutput>