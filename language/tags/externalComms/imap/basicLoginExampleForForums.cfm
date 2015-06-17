<cfset stCreds = {
	server		= "imap.gmail.com",
	secure		= "true",
	port		= "993",
	username	= "adam.cameron.junkmail@googlemail.com",
	password	= "temp.pwd"

}>

<cfimap	action				= "open"
		connection			= "myImapCon"
		attributecollection	= "#stCreds#"	<!--- these are set further up, and are all valid --->
>

<cfdump var="#myImapCon#" label="Raw dump">
<cfdump var="#structKeyArray(myImapCon)#" label="Key dump">
