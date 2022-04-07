<cffile action="read" file="C:\temp\test.rtf" variable="sRtf" charset="utf-8">

<cfquery datasource="scratch">
	insert into tbl_rtf(
		rtf_file
	)values(
		<cfqueryparam cfsqltype="cf_sql_longvarchar" value="#sRtf#">
	)
</cfquery>

<cfquery name="q" datasource="scratch" maxrows="1">
	select	top 1 rtf_file
	from	tbl_rtf
	order by	rtf_id desc
</cfquery>

<cffile action="write" file="C:\temp\test2.rtf" output="#q.rtf_file[1]#" charset="utf-8">