<cftry>
	<cfcollection action="delete" collection="scratch"> 
	<cfcatch>
	</cfcatch>
</cftry>
<cfcollection
	action		= "create"
	collection	= "scratch"
	path		="#server.coldfusion.rootDir#\collections"
	engine		= "solr" 
>
<cfinclude template="./indexCollection.cfm">