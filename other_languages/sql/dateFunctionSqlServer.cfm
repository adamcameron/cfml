<cfquery name="q" datasource="junk" result="st">
	select		zap_id, zap_data, zap_datetime
	from		tbl_zapme
	where		datediff(year, zap_datetime, <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">) <= 3
</cfquery>
<cfdump var="#q#" label="q">
<cfdump var="#st#" label="st">