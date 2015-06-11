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

	Trying to get headers&hellip;
	<cfimap connection="myImapCon" action="getall" name="qAll" attachmentpath="c:\temp\" generateuniquefilenames="true">
	<cfdump var="#qAll#">
	
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



