<cfparam name="URL.iterations" type="integer">
<cfloop index="i" from="1" to="#URL.iterations#">
	<cfinclude template="all.cfm">
</cfloop>