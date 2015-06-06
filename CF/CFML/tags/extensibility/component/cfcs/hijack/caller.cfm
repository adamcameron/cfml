<cfset o = createObject("component", "c")>
<cfdump var="#o#">

<cffunction name="badFunction" output="false">
	<cfreturn secret>
</cffunction>

<cfset o.hijack = badFunction>

<cfdump var="#o.hijack()#">

<cffunction name="worseFunction" output="false">
	<cfset secret = "fuck all">
</cffunction>

<cfset o.safeFunction = worseFunction>
<cfset o.safeFunction()>
<cfdump var="#o.hijack()#">
