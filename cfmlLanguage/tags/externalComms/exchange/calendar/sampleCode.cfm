<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangemail action="get" connection="connExch" name="getMails" folder="Inbox">
		<cfexchangefilter name="messageType" value="meeting">
	</cfexchangeMail>

	<!--- Note that message_type can take the following values - mail, meeting, meeting_cancel, meeting_request, meeting_response, all. --->
	<cfdump var="#getMails#">


	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>


