<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangecalendar	action		= "get"
					    name		= "qCalendar"
					    connection	= "connExch"
	>
		<cfexchangefilter name="uid" value="040000008200E00074C5B7101A82E0080000000060D6F51A809AC9010000000000000000100000005EDE036820DDB24AA31F5E8BE105FDA9">
	</cfexchangecalendar>

	<cfdump var="#qCalendar#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>