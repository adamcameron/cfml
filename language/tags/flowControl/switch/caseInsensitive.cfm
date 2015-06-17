<cfswitch expression="#URL.number#">
	<cfcase value="one">
		lower
	</cfcase> 
	<cfcase value="ONE">
		upper
	</cfcase> 
</cfswitch>