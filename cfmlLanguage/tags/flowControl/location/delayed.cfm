<!--- delayed.cfm --->
<cfset chunk = URL.size \ 2>
<cfoutput>#repeatstring("x", chunk)#</cfoutput>
<cfset sleep(5000)>
<cfoutput>#repeatstring("y", chunk)#</cfoutput>
<cflocation url="target.cfm" addtoken="false">