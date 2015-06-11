<cfset stCreds = {
	server		= "imap.gmail.com",
	secure		= "true",
	port		= "993",
	username	= "cameron.adam@googlemail.com",
	password	= "ocelotUK"
}>
	

<!--- imapAttributes is a struct containing username and password information --->
<cfimap action="listallfolders" attributecollection="#stCreds#" name="qFolders">

<cfdump var="#qFolders#">