<!--- flushTest.cfm --->
<cfflush interval="16">
<cfloop index="i" from="1" to="1000">
	.
	<cfif not i mod 50>
		<br>
	</cfif>
	<cfset sleep(10)>
</cfloop>
