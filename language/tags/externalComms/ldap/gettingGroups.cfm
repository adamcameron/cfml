<cfldap
	action		= "query"
	name		= "qGroups"
	start		= "CN=Adam Cameron,CN=Users,DC=shado,DC=co,DC=nz"
	attributes	= "memberOf"
	server		= "192.168.5.11"
	username	= "administrator@shado.co.nz"
	password	= "y@ngtz3"
	separator	= "#chr(7)#"
>
<cfif qGroups.RecordCount>
	<cfloop index="sGroup" list="#qGroups.memberOf[1]#" delimiters="#chr(7)#">
		<cfoutput>[#sGroup#]</cfoutput><br />	
	</cfloop>
</cfif>
<cfdump var="#qGroups#">