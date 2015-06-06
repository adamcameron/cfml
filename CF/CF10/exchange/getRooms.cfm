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
	
	getRoomList&hellip;	
	<cfexchangecalendar action="getRoomList" name="qRoomList" connection="exchConn">
	OK<br />
	<cfdump var="#qRoomList#">
	getRooms&hellip;
	<cfexchangecalendar action="getRooms" emailaddress="groundfloor1@cfadobe.com" name="qRooms"	connection="exchConn">
	OK<br />
	<cfdump var="#qRooms#">
		
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

