<cftry>
	<cfinclude template="./credentials.cfm">
	<cfexchangeconnection
		action				= "open" 
		connection			= "exchConn" 
		serverversion		= "2012"
		attributecollection	= "#stCredentials#"
	>
	<cfdump var="#variables#">
	<cfcatch>
		<cfdump var="#cfcatch#" label="Exception when opening connection">
	</cfcatch>
</cftry>