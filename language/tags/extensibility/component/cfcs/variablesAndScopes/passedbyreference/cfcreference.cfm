<cffunction name="functionToInsert" output="false">
	<cfreturn />
</cffunction>

<cfset o = createObject("component", "c")>
<cfdump var="#o#">

<cfset o.transmuter(o, functionToInsert)>
<cfdump var="#o#">