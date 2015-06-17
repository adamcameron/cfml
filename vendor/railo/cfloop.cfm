<cfset numbers = ['tahi','rua', 'toru', 'wha']>

<cfloop index="i" item="item" array="#numbers#">
	<cfoutput>#i#: #item#<br></cfoutput>
</cfloop>
<hr>
<cfloop index="i" array="#numbers#">
	<cfoutput>#i#<br></cfoutput>
</cfloop>
