<cfquery name="q" datasource="b27mysql">
	show tables
</cfquery>
<cfdump var="#q#">
<cfoutput query="q">
#q.tables_in_b27mysql#<br />
</cfoutput>