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
	getUserAvailability&hellip;
	<cfexchangecalendar
		action			= "getUserAvailability"
		attendees		= "Cfexchange-v10-test1@wharton.upenn.edu,Cfexchange-v10-test2@wharton.upenn.edu"
		connection		= "exchConn"
		startDate		= "#now()#"
		endDate			= "#dateAdd('d', 7, now())#"
		dataRequestType = "freeBusy"	<!--- freeBusy|suggestions|freeBusyandSuggestions --->
		name			= "qResult"
	>
	OK
	<cfdump var="#qResult#">
		
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



