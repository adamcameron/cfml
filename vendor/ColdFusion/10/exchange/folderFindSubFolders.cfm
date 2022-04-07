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
	Getting info&hellip;	
	<cfexchangefolder connection="exchConn" action="getInfo" folderpath="/" name="qFolderInfo">
	complete<br />
	<cfdump var="#qFolderInfo#"> 
	
	<cfif qFolderInfo.recordCount>
		<cfexchangefolder connection="exchConn" action="findSubFolders" uid="#qFolderInfo.uid[1]#" name="qFolderInfo">
		<cfdump var="#qFolderInfo#">
	<cfelse>
		No info found.  Test aborted<br /> 
	</cfif>
		
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