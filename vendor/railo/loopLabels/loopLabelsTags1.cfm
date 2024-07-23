<cfset loopThreshold = 3>

<cfloop index="x" from="1" to="5" label="loopLabel">
	Top of loop with <br>
	<cfif x GE loopThreshold>
		<cfbreak "loopLabel">
	</cfif>
	Bottom of loop<br>
</cfloop>
After loop<br>
