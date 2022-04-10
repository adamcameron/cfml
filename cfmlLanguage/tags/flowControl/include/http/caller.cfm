<cfhttp method="post" URL="http://localhost:8307/CFIDE/administrator/">
	<cfinclude template="./params.cfm">
</cfhttp>
<cfdump var="#cfhttp#">