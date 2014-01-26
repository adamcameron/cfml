<!--- testFlush.cfm--->
Beginning of request<br>
<cfoutput>#repeatString(" ", 16*1024)#</cfoutput>
<cfflush>
<cfset sleep(3000)>
After first flush<br>
<cfoutput>#repeatString(" ", 16*1024)#</cfoutput>
<cfflush>
<cfset sleep(3000)>
After second flush<br>
<cfoutput>#repeatString(" ", 16*1024)#</cfoutput>
<cfflush>
<cfset sleep(3000)>
End of request<br>
