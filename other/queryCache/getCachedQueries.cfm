<cfset oDataSourceService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService>
<cfset oCv = createObject("java", "ClassViewer")>

<cfdump var="#oDataSourceService.getCachedQueries()#">