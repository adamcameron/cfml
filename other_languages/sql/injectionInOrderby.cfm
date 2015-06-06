<cfparam name="URL.sortOrder" default="ASC">

<cfquery name="q" datasource="junk" result="st">
	select		*
	from		tbl_zapme
	order by	zap_id #URL.sortOrder#
</cfquery>

<cfdump var="#q#" label="q">
<cfdump var="#st#" label="st">