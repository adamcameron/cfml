<cfset mmmm = "february">
<cfoutput>#dateFormat(parseDateTime("1 #mmmm# #year(now())#"), "mm")#</cfoutput>