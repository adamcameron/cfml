<cfflush interval="16">
<cftry>
	<cfinclude template="./credentials.cfm">
	Opening connection&hellip;
	<cfexchangeconnection
		action				= "open" 
		connection			= "exchConn" 
		serverversion		= "2010"
		attributecollection	= "#stCredentials#"
	>
	opened<br />
	
	
	<cfexchangefolder connection="exchConn" action="getInfo" folderpath="/" name="qFolderInfo">
	<cfdump var="#qFolderInfo#"> 
	
	<cfexchangefolder connection="exchConn" action="getExtendedInfo" folderpath="/" name="qFolderInfo">
	<cfdump var="#qFolderInfo#"> 
		
	<cfcatch>
		<cfdump var="#cfcatch#" label="Exception when opening connection">
	</cfcatch>
	<cffinally>
		<cftry>
			Closing connection&hellip;
			<cfexchangeconnection action="close" connection="exchConn">
			closed<br />
			<cfcatch>
				<cfdump var="#cfcatch#" label="Exception when closing connection">
			</cfcatch>
		</cftry>	
	</cffinally>
</cftry>