<cfset q = application.oApiExtensions.getMappings()>
<cfdump var="#q#">

<cfset application.oApiExtensions.setMapping("/com/tastingnotes2", "C:\webroots\CF9B2\com\tastingnotes")>
<cfset q = application.oApiExtensions.getMappings()>
<cfdump var="#q#">

<cfset application.oApiExtensions.deleteMapping("/com/tastingnotes2")>
<cfset q = application.oApiExtensions.getMappings()>
<cfdump var="#q#">
