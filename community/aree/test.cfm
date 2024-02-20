<cfif true>
	<cffunction name="test_function" output="false">
	    <cfreturn "100">
	</cffunction>
	<cfoutput>#test_function()#</cfoutput>
<cfelse>
	<cffunction name="test_function" output="true">
	    <cfreturn "200">
	</cffunction>
	<cfoutput>#test_function()#</cfoutput>
</cfif>
