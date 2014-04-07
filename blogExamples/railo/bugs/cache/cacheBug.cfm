<cfset timeNow = timeFormat(now(), 'HH:MM:SS.LLL')>

<cfoutput>The time now is: #timeNow#<br></cfoutput>
<cfcache action="cache" timeout="#createTimespan(0,0,1,0)#">
	<cfoutput>The time when cached was #timeNow#<br></cfoutput>
</cfcache>