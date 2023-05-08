<cfset o = createObject("component", "Foo")>
<cfset o = o.getSelf()>
<cfdump var="#o#">