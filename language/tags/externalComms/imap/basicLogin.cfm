<cftry>
	Trying to open IMAP connection&hellip;
	<cfset stCreds = {
		server		= "imap.gmail.com",
		secure		= "true",
		port		= "993",
		username	= "adam.cameron.junkmail@googlemail.com",
		password	= "temp.pwd"
	
	}>
	
	<cfimap	action				= "open"
			connection			= "myImapCon"
			attributecollection	= "#stCreds#"	<!--- these are set further up, and are all valid --->
	>
	Opened<br />
	<cfdump var="#myImapCon#" label="IMAP Connection">
	
	<cfcatch>
		Error: #cfcatch.error# #cfcatch.message#<br />
		<cftry>
			Attempting to close connection&hellip;
			<cfimap action="close" connection="myImapCon">
			Closed<br />
			<cfcatch>
				Error: #cfcatch.error# #cfcatch.message#<br />
			</cfcatch>
		</cftry>		
	</cfcatch>
	<cffinally>
		<cftry>
			Attempting to close connection&hellip;
			<cfimap action="close" connection="myImapCon">
			Closed<br />
			<cfcatch>
				Error: #cfcatch.error# #cfcatch.message#<br />
			</cfcatch>
		</cftry>		
	</cffinally>
</cftry>

<cfdump var="#variables#" label="Variables">
