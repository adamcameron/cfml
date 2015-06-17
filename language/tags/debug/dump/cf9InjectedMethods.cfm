<cfset o = createObject("component", "Cf9InjectedMethods")>

<cffunction name="g" access="public" returntype="boolean" output="false" hint="g()'s hint.">
	<cfargument name="b" type="boolean" required="true" hint="A boolean arg">
	<cfreturn not arguments.b>
</cffunction>

<cfset o.g = g>

<cfset o2 = createObject("component", "Cf9InjectedMethods2")>
<cfset o.h = o2.h>

<cfset o3 = createObject("component", "Cf9InjectedMethods")>
<cfset o.i = o3.f>

<cfdump var="#o#">
	
