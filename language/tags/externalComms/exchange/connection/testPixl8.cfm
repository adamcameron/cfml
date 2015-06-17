<cfexchangeconnection	action		= "open"
						connection	= "connExch"
						server		= "mailgate.pixl8.co.uk"
						protocol	= "https"
						username	= "Adam.Cameron"
						password	= "b33r&Ch1ps"
>

<cfdump var="#connExch#">

<cfexchangeconnection	action		= "getSubfolders"
						connection	= "connExch"
						name		= "qFolders"
						recurse		= "true"
>
<cfdump var="#qFolders#">


<cfexchangeconnection action="close" connection="connExch">
