<cfset o = createObject("component", "c")>

<cfset o["_f"] = o.f>

<cfset fWithEvents(f=o.f)>

<cfset o.f()>
<cfdump var="#getMetadata(o)#">
<cfdump var="#o#">


<cffunction name="fWithEvents">
	<cfargument name="f">
	Before f()<br />
	<cfset arguments.f()>
	After f()<br />
</cffunction>
