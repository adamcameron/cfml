<cfset count = 0>
<cfset threshold = 5>
<cfset outerPanicAt = 10>
<cfset outerPanicCount = 0>
<cfset innerPanicAt = 10>
<cfset innerPanicCount = 0>

<cfloop condition="outerPanicCount LE outerPanicAt" label="outer">
	<cfset outerPanicCount++>
	<cfoutput>outerPanicCount: #outerPanicCount#<br></cfoutput>
	<cfloop condition="innerPanicCount LE innerPanicAt">
		<cfset innerPanicCount++>
		<cfoutput>innerPanicCount: #innerPanicCount#<br></cfoutput>
		<cfset count++>
		<cfoutput>count: #count#<br></cfoutput>
		<cfif count GE threshold>
			Threshold met<br>
			<cfbreak "outer">
		</cfif>
		Bottom of inner loop<br>
	</cfloop>
	Bottom of outer loop<br>
</cfloop>
After loops<br>