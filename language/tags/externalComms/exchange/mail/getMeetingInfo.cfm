<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangemail	action		= "getMeetingInfo"
					meetingUID	= "040000008200E00074C5B7101A82E00800000000D0406187879AC901000000000000000010000000866CF45972B7A04DA7A9E942EB961F33"
					name		= "qMeeting"
					connection	= "connExch"
	>

	<cfdump var="#qMeeting#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>