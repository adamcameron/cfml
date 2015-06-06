<cfparam name="URL.msg">
<cfquery name="q" datasource="intranet">
	insert into tbl_log (
		log_text
	) values (
		<cfqueryparam value="#URL.msg#" cfsqltype="CF_SQL_LONGVARCHAR">
	) returning
</cfquery>