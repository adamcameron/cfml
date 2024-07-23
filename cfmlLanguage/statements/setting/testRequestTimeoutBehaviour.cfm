<cfif URL.keyExists("timeout")>
    <cfsetting requesttimeout="#URL.timeout#">
</cfif>

<cfflush interval="16">
<cfloop index="i" from="0" to="60">
    <cfoutput>#i##repeatString(" ", 16)#<br></cfoutput>
    <cfset sleep(1000)>
</cfloop>
