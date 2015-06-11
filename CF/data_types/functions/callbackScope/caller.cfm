<!--- caller.cfm --->
<cfset copyF = createObject("component", "c1").f>

<cfset o = createObject("component", "c2")>

<cfoutput>#o.g(copyF)#</cfoutput>