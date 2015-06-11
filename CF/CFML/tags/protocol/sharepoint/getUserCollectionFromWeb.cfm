<cfset stAttributes = {
		action	= "GetUserCollectionFromWeb",
		wsdl	= "http://ws2k3std-test/_vti_bin/usergroup.asmx?wsdl",
		login	= application.sharepoint.credentials,
		name	= "qResult"
	}
>

<cfsharepoint attributecollection="#stAttributes#" />

<cfset st = {var=qResult}>
<cfdump attributecollection="#st#">
