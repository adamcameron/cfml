<cfset stAttributes = {
		action	= "getUserInfo",
		params	= {userLoginName='WS2K3STD-TEST\test_reader'},
		login	= application.sharepoint.credentials,
		name	= "qResult"
	}
>

<cfsharepoint attributecollection="#stAttributes#" />

<cfset st = {var=qResult}>
<cfdump attributecollection="#st#">
