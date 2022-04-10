<cfset stAttributes = {
		action	= "getlist",
		params	= {listname='{F7941704-4293-4976-BA39-AD2CE2BC4090}'},
		login	= application.sharepoint.credentials,
		name	= "qResult"
	}
>

<cfsharepoint attributecollection="#stAttributes#" />

<cfset st = {var=qResult}>
<cfdump attributecollection="#st#">
