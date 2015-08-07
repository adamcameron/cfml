<cfset oDataSourceService = createObject("java", "coldfusion.server.ServiceFactory").DataSourceService>
<cfset oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfoutput>
<pre>
	#oCv.viewObject(oDataSourceService)#
</pre>
</cfoutput>
