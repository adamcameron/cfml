<cfflush>
Top of caller.cfm<br />
<cfset o = createObject("component", "c")>
<cfoutput>#o.f()#</cfoutput>