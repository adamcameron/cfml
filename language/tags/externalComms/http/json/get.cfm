<style>
	th {
		vertical-align	: top;
	}
</style>

<cfhttp url="http://localhost:8902/shared/CF/CFML/tags/protocol/http/json/target.cfm" result="response">
<cfset responseBody = response.fileContent>
<cfoutput>
<table border="1">
	<tbody>
		<tr><th>HTTP Response</th><td><cfdump var="#response#" label="HTTP response"></td></tr>
		<tr><th>Response Body</th><td><cfdump var="#responseBody#" label="Response body"></td></tr>
		<tr><th>Java Class</th><td>#responseBody.getClass().getName()#</td></tr>
		<tr><th>isObject()</th><td>#isObject(responseBody)#</td></tr>
		<tr><th>isSimpleValue()</th><td>#isSimpleValue(responseBody)#</td></tr>
		<tr><th>isJson()</th><td>#isJson(responseBody)#</td></tr>
		<tr><th>isStruct()</th><td>#isStruct(responseBody)#</td></tr>
		<tr><th>toString()</th><td>#responseBody.toString()#</td></tr>
		<tr><th>Raw output</th><td>#responseBody#</td></tr>
		<tr><th>deserializeJson()</th><td><cfdump var="#deserializeJson(responseBody)#" label="deserializeJson()"></td></tr>
	</tbody>
</table>
</cfoutput>