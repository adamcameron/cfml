<cfset oDataSourceService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService>
<cfset oCv = createObject("java", "ClassViewer")>

<cfoutput>
<pre>
	#oCv.viewObject(oDataSourceService)#
</pre>
</cfoutput>
