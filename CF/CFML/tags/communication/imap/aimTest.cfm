<cftry>
	Trying to open IMAP connection&hellip;
	<cfset stCreds = {
		server		= "imap.aim.com",
		secure		= false,
		port		= "143",
		username	= "cameronadamjunk@aol.com",
		password	= "ocelotZ2"
	
	}>
	
	<cfimap	action				= "open"
			connection			= "myImapCon"
			attributecollection	= "#stCreds#"	<!--- these are set further up, and are all valid --->
	>
	Opened<br />

	Trying to get headers&hellip;
	<cfimap connection="myImapCon" action="getheaderonly" name="qHeaders">
	<cfdump var="#qHeaders#" show="messageid,messagenumber,subject,uid" label="All">
	
	<cfloop query="qHeaders">
		<cfimap connection="myImapCon" action="getheaderonly" name="qHeader" messagenumber="#CurrentRow#">
		<cfdump var="#qHeader#" show="messageid,messagenumber,subject,uid" label="Msg #currentRow#">
	</cfloop>

	<cfimap connection="myImapCon" action="getheaderonly" name="qHeader" messagenumber="42">
	<cfdump var="#qHeader#" show="messageid,messagenumber,subject,uid" label="Msg 42">

	
	<cfcatch>
		<cfoutput>Error: [#cfcatch.message#] [#cfcatch.detail#]<br /></cfoutput>
		<cftry>
			Attempting to close connection&hellip;
			<cfimap action="close" connection="myImapCon">
			Closed<br />
			<cfcatch>
				<cfoutput>Error: [#cfcatch.message#] [#cfcatch.detail#]<br /></cfoutput>
			</cfcatch>
		</cftry>		
	</cfcatch>
	<cffinally>
		<cftry>
			Attempting to close connection&hellip;
			<cfimap action="close" connection="myImapCon">
			Closed<br />
			<cfcatch>
				<cfoutput>Error: [#cfcatch.message#] [#cfcatch.detail#]<br /></cfoutput>
			</cfcatch>
		</cftry>		
	</cffinally>
</cftry>
