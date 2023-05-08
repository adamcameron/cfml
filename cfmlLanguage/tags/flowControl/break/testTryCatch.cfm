<cfoutput>
<cfflush interval="20">
<cfset i = 0>
Before loop<br />
<cfloop condition="i le 10">
	Top of loop<br />
	<cftry>
		<cfif i le 5>
			#i# le 5<br />
			<cfthrow type="test" message="increment">
		<cfelse>
			#i# gt 5<br />
		</cfif>
		break<br />
		<cfbreak>
		<cfcatch type="test">
			Exception caught<br />
			<cfset i = i + 1>
			i incremented<br />
		</cfcatch>
	</cftry>
</cfloop>
After loop<br />
</cfoutput>