<cfldap	action		= "query"
		name		= "qLocal"
		server		= "localhost"
		port		= "10389"
		start		= "ou=users,dc=example,dc=com"
		attributes	= "*"
		scope		= "onelevel"
		username	= "uid=admin,ou=system"
		password	= "secret"
>
<!--- <cfdump var="#qLocal#"> --->

<cfquery name="qAttributes" dbtype="query">
	select		distinct name
	from		qLocal
	order by	name
</cfquery>

<cfldap	action		= "query"
		name		= "qUsers"
		server		= "localhost"
		port		= "10389"
		start		= "ou=users,dc=example,dc=com"
		attributes	= "#valueList(qAttributes.name)#"
		scope		= "onelevel"
		username	= "uid=admin,ou=system"
		password	= "secret"
		filter		= "sn=Einstein"
>
<cfdump var="#qUsers#">

<cffile action="write" file="#expandPath('./')#einstein.jpg" output="#qUsers.jpegphoto[1]#">
