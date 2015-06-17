<!--- caller.cfm --->
<cfset o = createObject("component", "child")>
<cfdump var="#o.get()#">