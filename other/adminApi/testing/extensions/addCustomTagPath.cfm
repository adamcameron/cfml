<cfset q = application.oApiExtensions.getCustomTagPaths()>
<cfdump var="#q#">

<cfset application.oApiExtensions.setCustomTagPath("C:\temp")>
<cfset q = application.oApiExtensions.getCustomTagPaths()>
<cfdump var="#q#">

<cfset application.oApiExtensions.deleteCustomTagPath("C:\tempx")>
<cfset q = application.oApiExtensions.getCustomTagPaths()>
<cfdump var="#q#">

