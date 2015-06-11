<cfset dStart = now()>
<cfset iStart = getTickCount()>
<cfset createObject("java", "java.lang.Thread").sleep(500)>
<cfset iEnd = getTickCount()>
<cfset dEnd = now()>

<cfoutput>
	getTickCount(): [#iEnd - iStart#]<br />
	now(): [#dEnd - dStart#]<br />
</cfoutput>
