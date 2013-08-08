<cfset count = 0>
<cftry>
	<hr>
	Count: <cfoutput>#count#</cfoutput><br>
	Above exception<br>
	<cfset x = 1/0>
	Below exception<br>
	<cfcatch>
		Top of CATCH<br>
		<cfset count++>
		<cfif count LE 5>
			Before RETRY<br>
			<cfretry>
			After RETRY<br>
		</cfif>
		Bottom of CATCH<br>
	</cfcatch>
</cftry>
After TRY<br>