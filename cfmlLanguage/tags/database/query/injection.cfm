<cfset dsn = "junk_mssql">
<cfparam name="URL.label" default="">
<cfquery name="qTest" datasource="#dsn#" result="st">
	select	*
	from	Table1
	where	T1_label ='#URL.label#'
</cfquery>
<cfdump var="#st#">

