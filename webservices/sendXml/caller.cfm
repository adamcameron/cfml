<cfset o = createObject("webservice", "http://localhost:8305/shared/cf/webservices/sendXml/c.cfc?wsdl")>

<cfxml variable="x1">
	<aaa>
		<bbb>ccc</bbb>
	</aaa>
</cfxml>

<cfset x2 = o.f(x=x1)>

<cfdump var="#x1#" label="x1">
<cfdump var="#x2#" label="x2">