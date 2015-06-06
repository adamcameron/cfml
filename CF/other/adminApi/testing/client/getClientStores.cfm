<cfset q = application.oApiRuntime.getClientStores()>
<cfdump var="#q#">

<cfset application.oApiRuntime.setClientStore("Registry")>
<cfset q = application.oApiRuntime.getClientStores()>
<cfdump var="#q#">
