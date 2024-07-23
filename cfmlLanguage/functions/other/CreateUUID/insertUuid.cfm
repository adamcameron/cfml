<cfquery name="qIns" datasource="junk_mssql">
	insert into uTable (ut_udata) values (<cfqueryparam cfsqltype="cf_sql_idstamp" value="#insert("-", createUuid(), 23)#">)
</cfquery>
