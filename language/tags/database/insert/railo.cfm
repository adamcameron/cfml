<cfset dsn = "scratch_mssql">

<cfset tst_data = createUuid()>
<cfquery datasource="#dsn#" result="st1">
	insert into tbl_test(tst_data)values('railo2')
</cfquery>
<cfquery datasource="#dsn#" result="st2">
	insert into tbl_test(tst_data)values(<cfqueryparam value="#tst_data#">)
</cfquery>
<cfdump var="#variables#">