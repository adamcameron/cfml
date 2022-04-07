<cfflush interval="16">
<cftry>
	<cfinclude template="../credentials.cfm">
	Opening connection&hellip;
	<cfexchangeconnection
		action				= "open" 
		connection			= "exchConn" 
		serverversion		= "2010"
		attributecollection	= "#stCredentials#"
	>
	opened<br />
	Getting calendar info&hellip;	
	<cfexchangecalendar action="get" name="qMeeting" connection="exchConn">
		<cfexchangefilter name="startTime" from="#createDateTime(2012, 2, 1, 0, 0, 0)#" to="#createDateTime(2012, 2, 29, 23, 59, 59)#">
	</cfexchangecalendar>
	complete<br />
	<cfdump var="#qMeeting#"> 
	
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



