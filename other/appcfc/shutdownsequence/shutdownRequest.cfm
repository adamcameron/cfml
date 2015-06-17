<!--- shutdownRequest.cfm --->
<cfset logIt("Start requested template")>
<cfoutput>#now()#</cfoutput>
<cfset applicationStop()>
<cfset logIt("End requested template")>