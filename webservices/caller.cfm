<cfset oWs = createObject("webservice", "testRemote")>
<cfoutput>#oWs.ping(message="Hello World?")#</cfoutput>