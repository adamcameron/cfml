<cfflush interval="16">
<cfloop index="i" from="1" to="10">
	<cfoutput>#timeFormat(now(), "HH:MM:SS.LLL")#<br /></cfoutput>
	<cfset u = createUuid()>
	<cftimer label="CFTIMER: #u#" type="debug">
		<cfset sleep(250+randRange(0,500))>
		<cfoutput>[#right(getTickCount(), 5) mod 1000#]</cfoutput>
	</cftimer>
</cfloop>
