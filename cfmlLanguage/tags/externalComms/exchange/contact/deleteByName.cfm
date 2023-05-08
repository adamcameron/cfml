<cfparam name="URL.name" type="regex" pattern="(?i)^[A-Z]*?\s[A-Z]*?$">
<cftry>
	<cfinclude template="../connection/open.cfm">

	<cfexchangecontact	action		= "get"
						name		= "qContacts"
						connection	= "connExch"
	>
		<cfexchangefilter name="firstName" value="#listFirst(URL.name, ' ')#">
		<cfexchangefilter name="lastName" value="#listLast(URL.name, ' ')#">
	</cfexchangecontact>

	<cfif qContacts.recordCount>
		<cfexchangecontact	action		= "delete"
							uid			= "#qContacts.uid[1]#"
							connection	= "connExch"
		/>
		Deleted
	<cfelse>
		No match found
	</cfif>

	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
	<cffinally>
		<cfinclude template="../connection/close.cfm">
	</cffinally>
</cftry>