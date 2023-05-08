<cfquery name="q" datasource="scratch">
	SELECT	*
	FROM	tbl_test
</cfquery>

<cfdump var="#q#">