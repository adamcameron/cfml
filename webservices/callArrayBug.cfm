<cfset o = createObject("component", "ArrayBug")>
<h2>Local</h2>
<cftry>
	<cfdump var="#o.emptyArray()#" label="emptyArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfdump var="#o.stringArray()#" label="stringArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfdump var="#o.complexArray()#" label="complexArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfdump var="#o.toVector()#" label="toVector()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cfset oWs = createObject("webservice", "http://localhost:8301/shared/CF/webservices/ArrayBug.cfc?wsdl")>
<h2>Web Service</h2>
<cftry>
	<cfdump var="#oWs.emptyArray()#" label="emptyArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfdump var="#oWs.stringArray()#" label="stringArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfdump var="#oWs.complexArray()#" label="complexArray()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfdump var="#oWs.toVector()#" label="toVector()">
	<cfcatch>
		<cfoutput>#cfcatch.Message# #cfcatch.Detail#<br /></cfoutput>
	</cfcatch>
</cftry>
