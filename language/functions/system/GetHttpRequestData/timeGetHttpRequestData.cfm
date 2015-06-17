<cfflush interval="128">
<cfoutput><cfloop index="i" from="1" to="32"><cfloop index="j" from="1" to="1024">abcdefghijklmnopqrstuvwxyz</cfloop><br /></cfloop></cfoutput>
<cfset i = getTickCount()>
<cfset o = GetHttpRequestData()>
<cfoutput>Elapsed time: #getTickCount() - i#</cfoutput>