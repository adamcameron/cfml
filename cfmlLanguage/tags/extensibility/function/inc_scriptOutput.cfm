<cfloop index="i" from="1" to="10">
	<cfif randRange(0, 2)>
		<cfset ts = now()>
	</cfif>
</cfloop>