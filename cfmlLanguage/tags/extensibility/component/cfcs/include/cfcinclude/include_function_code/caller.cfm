<cfset o = createObject("component", "c")>
<cfset o.f()>
<cfdump var="#o.getVariables()#">