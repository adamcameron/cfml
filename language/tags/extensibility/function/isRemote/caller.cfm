<cfset o = createObject("component", "c")>
<cfset ws = createObject("webservice", "http://localhost:8305/shared/cf/cfml/function/isRemote/c.cfc?wsdl")>

<cfdump var="#variables#">