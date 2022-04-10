<cfoutput>
<cfscript>
	ldapConnection			= structnew();
	ldapConnection.server	= "moonbase";
	ldapConnection.user		= "administrator@shado.co.nz";
	ldapConnection.pwd		= "@queenst";
</cfscript>

Querying the base of the tree (no start, scope="base") is kind of a bootstrap query to find where the directory is rooted:<br />
<pre>
&lt;cfldap	action		="query"
	name		= "getBase"
	start		= ""
	scope		= "base"
	attributes	= "defaultNamingContext"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
&gt;
</pre>
<cfldap	action		="query"
	name		= "getBase"
	start		= ""
	scope		= "base"
	attributes	= "defaultNamingContext"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
>
<cfdump var="#getBase#" label="getBase">
<hr />

Querying an object and asking for attributes=* returns all the attribute names, and ONE value for each; note the query is one ROW per attribute<br />
<pre>
&lt;cfldap	action		="query"
	name		= "getAttributes"
	start		= "#getBase.defaultNamingContext#"
	scope		= "base"
	attributes	= "*"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
&gt;
</pre>
<cfldap	action		="query"
	name		= "getAttributes"
	start		= "#getBase.defaultNamingContext#"
	scope		= "base"
	attributes	= "*"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
>
<cfdump var="#getAttributes#" label="getAttributes">
<hr />


Querying an object and asking for specific attributes returns all the values for the attributes. Note the query is one COLUMN per attribute<br />
<pre>
&lt;cfldap	action		="query"
	name		= "getAttributeValues"
	start		= "#getBase.defaultNamingContext#"
	scope		= "onelevel"
	attributes	= "objectCategory,distinguishedName"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
&gt;
</pre>
<cfldap	action		="query"
	name		= "getAttributeValues"
	start		= "#getBase.defaultNamingContext#"
	scope		= "onelevel"
	attributes	= "objectCategory,distinguishedName"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
>
<cfdump var="#getAttributeValues#" label="getAttributeValues">
<hr />


Querying for attributes in the USERS container; note they're different from @ the base level<br />
<pre>

&lt;cfldap	action		="query"
	name		= "getUserAttributes"
	start		= "CN=Users,DC=shado,DC=co,DC=nz"
	scope		= "base"
	attributes	= "*"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
&gt;
</pre>
<cfldap	action	="query"
	name		= "getUserAttributes"
	start		= "CN=Users,DC=shado,DC=co,DC=nz"
	scope		= "base"
	attributes	= "*"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
>
<cfdump var="#getUserAttributes#" label="getUserAttributes">
<hr />


Filtering on an attribute / value pair<br />
<pre>
&lt;cfldap	action		="query"
	name		= "getGroupMembers"
	start		= "CN=Users,DC=shado,DC=co,DC=nz"
	scope		= "onelevel"
	attributes	= "member"
	filter		= "name=strakerdevelopers"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
&gt;
</pre>
<cfldap	action	="query"
	name		= "getGroupMembers"
	start		= "CN=Users,DC=shado,DC=co,DC=nz"
	scope		= "onelevel"
	attributes	= "member"
	filter		= "name=strakerdevelopers"
	server		= "#ldapConnection.server#"
	username	= "#ldapConnection.user#"
	password	= "#ldapConnection.pwd#"
>
<cfdump var="#getGroupMembers#" label="getGroupMembers">
<hr />

</cfoutput>