<cfset oFile = createObject("webservice", "http://localhost:8302/shadomx/apps/fms/file.cfc?wsdl")>
<cfdump var="#oFile#">