<cfset oDirect = createObject("webservice",  "http://localhost:8240/shared/cf/cfcs/webservice/alias/ws.cfc?wsdl")>
<cfoutput>#oDirect.f(s="Calling it directly")#</cfoutput><br />

<cfinvoke webservice="wsAlias" returnvariable="s" method="f" s="Calling it via an alias">
<cfoutput>#s#</cfoutput><br />

