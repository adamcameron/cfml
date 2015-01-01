<cfloop item="x" array="#[1,2,3,4,5]#" label="outer">
	{
	<cfloop item="y" array="#[1,2,3,4,5]#">
		[
		<cfset z = x * y>
		<cfoutput>#z#</cfoutput>
		<cfif z GE 10>
			<cfbreak "outer">
		</cfif>
		]
	</cfloop>
	}<br>
</cfloop>