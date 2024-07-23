<cfset two = {id=2, en="two", ma="rua"}>

<cfhttp method="post" url="http://#CGI.http_host#/rest/components/testserialiser/echoStruct/" result="response">
	<cfhttpparam type="header" name="accept" value="application/JSON">
	<cfhttpparam type="body" value="#serializeJson(two)#">
</cfhttp>
<cfdump var="#response#">

<cfset two = {id=2, en="two", ma="rua"}>

<!---<cfhttp method="get" url="http://#CGI.http_host#/rest/components/testserialiser/echoStructViaUrl/" result="response">
	<cfhttpparam type="header" name="accept" value="application/JSON">
	<cfhttpparam type="url" name="data" value="#serializeJson(two)#">
</cfhttp>
<cfdump var="#response#">--->