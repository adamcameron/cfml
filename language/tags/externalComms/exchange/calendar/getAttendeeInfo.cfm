<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangecalendar	action		= "get"
					    name		= "qMeeting"
					    connection	= "connExch"
	>
		<cfexchangefilter name="subject" value="TEST MEETING 3">
	</cfexchangecalendar>
	<cfdump var="#qMeeting#" label="qMeeting">

	<cfexchangemail	action		= "get"
					name		= "qMeetingEmail"
					connection	= "connExch"
	>
		<cfexchangefilter name="subject" value="TEST MEETING 3">
	</cfexchangemail>
	<cfdump var="#qMeetingEmail#" label="qMeetingEmail">

	<cfexchangemail	action		= "getMeetingInfo"
					meetinguid	= "#qMeetingEmail.meetinguid[1]#"
					name		= "qMeetingInfo"
					connection	= "connExch"
	>
	<cfdump var="#qMeetingInfo#" label="qMeetingInfo">

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>