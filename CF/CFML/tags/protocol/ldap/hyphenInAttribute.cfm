<cfldap
	action		= "query"
	name		= "qObjects"
	start		= "o=SevenSeas"
	attributes	= "hyphenated-attribute"
	server		= "localhost"
	port		= "10389"
	username	= "uid=admin,ou=system"
	password	= "secret"
>
<cfdump var="#qObjects#">