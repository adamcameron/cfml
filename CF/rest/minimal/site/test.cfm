<cfhttp method="post" url="http://localhost:8500/rest/components/Greeter/" result="response">
	<cfhttpparam type="header" name="Content-Type" value="application/JSON">	
	<cfhttpparam type="body" value="#URL.name#">	
</cfhttp>
<cfdump var="#variables#">
