<cfcomponent displayname="foo">
<cffunction name="getBar" access="remote" returntype="bar">
     <cfreturn createObject("component", "bar")>
</cffunction>

</cfcomponent>