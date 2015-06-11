<cfset iBefore = getTickCount()>
<cfset sleep(10)>
<cfset iAfter = getTickCount()>
<cfoutput>#iAfter-iBefore#</cfoutput>