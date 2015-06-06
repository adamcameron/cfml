<cfset iLoopStart = gettickcount()>

<cfloop from="1" to="100000" index="i">
	<cfset x = i*2 + 1>
</cfloop>
<cfoutput>Loop execution time: #getTickCount() - iLoopStart#<br /></cfoutput>
