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
	<cfexchangefolder connection="exchConn" action="getExtendedInfo" uid="AAMkADhkZTdiZmI2LWU1ZDEtNDFmNC04MmE1LWI5NDQxY2Q0NTVkMgAuAAAAAADLiKvaRbnNT6pm2d9T2IWhAQAGaS3T1i8QS7nAISvzYw1vAAAAR+pgAAA=" name="qFolderInfo">
	complete<br />
	<cfdump var="#qFolderInfo#"> 
	
	<cfif qFolderInfo.recordCount>
		<cfexchangemail connection="exchConn" action="get" folder="Inbox/Adam Cameron Sub Folder 1" name="qMsgInfo">
		<cfdump var="#qMsgInfo#">
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