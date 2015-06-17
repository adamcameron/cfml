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
	Creating meetings&hellip;
	<cfset u = createUuid()>
	<cfexchangecalendar
		action		= "create"
		event		= "#{
			subject				= "CF10 TEST RECURRING MEETING (#u#)",
			location			= "CF10 TEST RECURRING MEETING (#u#) LOCATION",
			message				= "THIS IS A TEST MEETING CREATED BY ADAM CAMERON",
			startTime			= createDateTime(2012, 1, 3, 5, 0, 0),
			duration			= 60,
			importance			= "high",
			isrecurring			= true,
			recurrenceType		= "WEEKLY",
			RecurrenceNoEndDate	= true,
			RecurrenceFrequency	= 1,
			RecurrenceDays		= "TUE",
			categories			= "CF10 TEST CATEGORY 1,CF10 TEST CATEGORY 2",
			RequiredAttendees	= "cfexchange-v10-test1@wharton.upenn.edu,adam.cameron.signup+wharton@gmail.com",
			OptionalAttendees	= "Cfexchange-v10-test3@wharton.upenn.edu"
		}#"
		connection	= "exchConn"
		result		= "uid"
	>

	created <cfoutput>#uid#</cfoutput><br />
	Getting calendar info&hellip;	
	<cfexchangecalendar action="get" name="qMeeting" connection="exchConn">
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



