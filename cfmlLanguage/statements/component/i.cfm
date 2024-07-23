<cfloop index="i" from="1" to="#arguments.n#">
	<cfif i mod 2>
		<cfset l = listAppend(l, i)>
	</cfif>
</cfloop>
