<cf_loop iterations="10" index="i">
	<cfoutput>[#i#]</cfoutput>Hello World<br />
	<cfif i gt 5>
		<cf_break>
	</cfif>
</cf_loop>