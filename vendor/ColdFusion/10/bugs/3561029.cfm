<cfset st = {special=chr(7) & chr(9) & chr(13) & chr(27) & chr(128)}>
<cfset j = serializeJson(st)>
<cfoutput>#j#</cfoutput>