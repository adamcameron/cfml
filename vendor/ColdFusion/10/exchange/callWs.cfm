<cfset oWs = createObject("webservice", "http://localhost:#CGI.server_port#/shared/CF10/exchange/WS.cfc?wsdl")>

<cfset stGood = oWs.good()>
<cfdump var="#stGood#">

<cfset stBad = oWs.bad()>
<cfdump var="#stBad#">

<cftry>
	<cfset stUgly = oWs.ugly()>
	<cfdump var="#stUgly#">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>