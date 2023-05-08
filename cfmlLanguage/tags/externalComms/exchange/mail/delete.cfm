<cftry>
	Open<br />
	<cf_timeit>
		<cfinclude template="../connection/open.cfm">
	</cf_timeit>

	Fetch<br />
	<cf_timeit>
		<cfexchangemail	action		= "get"
						name		= "qMail"
						connection	= "connExch"
						folder		= "/Deleted Items"
		>
	</cf_timeit>
	<cfquery name="qUids" dbtype="query">
		select	uid
		from	qMail
	</cfquery>
	<cfif listLen(valueList(qMail.uid))>
		Delete<br />
		<cf_timeit>
			<cfexchangemail	action		= "delete"
							uid			= "#valueList(qMail.uid)#"
							connection	= "connExch"
							folder		= "/Deleted Items"
			>
		</cf_timeit>
	<cfelse>
		Nowt to delete<br />
	</cfif>
	<cfcatch>
		<cfdump var="#qUids#" label="qUids">
		<cfdump var="#cfcatch#" label="cfcatch">
	</cfcatch>
	<cffinally>
		Close<br />
		<cf_timeit>
			<cfinclude template="../connection/close.cfm">
		</cf_timeit>
	</cffinally>
</cftry>