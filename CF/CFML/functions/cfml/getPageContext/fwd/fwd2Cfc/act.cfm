<cfset request.myRequestVar = "REQUEST: " & timeFormat(now(), "HH:MM:SS.LLL")> 

<cfif form.fwdType eq "CFC">
	<cfset getPageContext().forward("./c.cfc?method=f&a=foo")>
<cfelse>
	<cfset getPageContext().forward("./c.cfm?method=f&a=foo")>
</cfif>