<cfset sleep(2000)>
<cfheader statusCode="#URL.statusCode#">
<cfoutput>The request resulted in a #URL.statusCode# status code @ #now().dateTimeFormat("HH:nn:ss.lll")#</cfoutput>