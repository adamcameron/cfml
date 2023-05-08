<cfquery name="q" datasource="test_news">
	select	*
	from	circuits
	where	1=0
</cfquery>
<cfdump var="#q#">
<cfoutput>[#q.uuid[101]#]</cfoutput>