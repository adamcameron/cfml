<!--- caller.cfm --->

<cfset o = createObject("component", "c")>
<cfset dynamic = "f">
<cfset o.temp = o[dynamic]>
<cfoutput>
#o.temp()#
</cfoutput>
