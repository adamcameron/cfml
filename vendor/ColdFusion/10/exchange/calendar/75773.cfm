<cfparam name="URL.label">
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
	<cfexchangecalendar
		action		= "create"
		event		= "#{
			subject				= "#URL.label# SUBJECT",
			location			= "#URL.label# LOCATION",
			message				= "#URL.label# MESSAGE",
			startTime			= createDateTime(2012, 1, 3, 22, 0, 0),
			endTime				= createDateTime(2012, 1, 3, 23, 0, 0),
			duration			= 60,
			importance			= "high",
			isrecurring			= true,
			recurrenceType		= "WEEKLY",
			recurrenceEndDate	= createDate(2012, 1, 17),
			RecurrenceFrequency	= 1,
			RecurrenceDays		= "TUE",
			categories			= "CF10 TEST CATEGORY 1,CF10 TEST CATEGORY 2"
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



