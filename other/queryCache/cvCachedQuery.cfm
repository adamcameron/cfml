<cfset oDataSourceService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService>
<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfset aCachedQueries = oDataSourceService.getCachedQueries()>

<cfoutput>
<pre>
	#oCv.viewObject(aCachedQueries[1])#
</pre>
</cfoutput>
