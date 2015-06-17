<cfflush interval="16">
<cfloop index="i" from="1" to="10">
	<cfoutput>#timeFormat(now(), "HH:MM:SS.LLL")#<br /></cfoutput>
	<cfset u = createUuid()>
	<cfset sleep(250+randRange(0,500))>
	<cfset i = right(getTickCount(), 5) mod 1000><!--- contrived nonsense --->
	<cftrace category="inLoop" inline="true" text="Ticks: [#i#]" type="Information">
		Stuff within TRACE: <cfoutput>[#u#]<br /></cfoutput>
	</cftrace>
</cfloop>

<cftrace var="variables" abort="true" />
<cfoutput>Shouldn't display this.</cfoutput>