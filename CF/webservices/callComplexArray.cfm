<cfset o = createObject("component", "ComplexArray")>
<h2>Local</h2>
<cftry>
	<cfdump var="#o.complexArray()#" label="complexArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cfset oWs = createObject("webservice", "http://localhost:#CGI.SERVER_PORT#/shared/CF/webservices/ComplexArray.cfc?wsdl")>
<h2>Web Service</h2>
<cftry>
	<cfdump var="#oWs.complexArray()#" label="complexArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

