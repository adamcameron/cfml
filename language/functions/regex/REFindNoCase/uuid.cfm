<cfset pos = REFindNoCase("[[:xdigit:]]{8,8}-[[:xdigit:]]{4,4}-[[:xdigit:]]{4,4}-[[:xdigit:]]{4,4}(-){0,1}[[:xdigit:]]{12,12}", createUUID())>
<cfoutput>#pos#</cfoutput><br />
<cfset pos = REFindNoCase("[[:xdigit:]]{8,8}-[[:xdigit:]]{4,4}-[[:xdigit:]]{4,4}-[[:xdigit:]]{4,4}(-){0,1}[[:xdigit:]]{12,12}", createObject("component", "uuid").createSQLUUID())>
<cfoutput>#pos#</cfoutput><br />