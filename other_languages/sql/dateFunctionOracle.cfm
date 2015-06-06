<cfquery name="q" datasource="junk" result="st">
	select		zap_id, zap_data, zap_datetime
	from		tbl_zapme
</cfquery>

<cfloop query="q">
	<cfset dTs = dateFormat(zap_datetime, "DD/MM/YYYY") & " " & timeFormat(zap_datetime, "HH:MM:SS")>
	<cfquery name="q" datasource="intranet" result="st">
		select		zap_id, zap_data, zap_datetime
		from		tbl_zap
		where		zap_datetime = TO_DATE(<cfqueryparam value="#dTs#" cfsqltype="cf_sql_varchar">, 'DD/MM/YYYY HH24:MI:SS')
	</cfquery>
	<cfdump var="#q#" label="q">
	<cfdump var="#st#" label="st">
</cfloop>

