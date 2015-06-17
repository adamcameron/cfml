<cfparam name="URL.message">
<cfoutput>#URL.message# before<br></cfoutput>
<cfclient>
	<cftry>
		<cfoutput>#URL.message# within<br></cfoutput>	
		<cfcatch>
		oops<br>
		</cfcatch>
	</cftry>
</cfclient>
<cfoutput>#URL.message# after<br></cfoutput>