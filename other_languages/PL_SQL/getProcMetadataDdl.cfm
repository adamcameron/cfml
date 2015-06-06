<!---
DBMS_METADATA.GET_DDL (
   object_type  IN VARCHAR2,
   name         IN VARCHAR2,
   schema       IN VARCHAR2 DEFAULT NULL,
   version      IN VARCHAR2 DEFAULT 'COMPATIBLE',
   model        IN VARCHAR2 DEFAULT 'ORACLE',
   transform    IN VARCHAR2 DEFAULT 'DDL')
RETURN CLOB;
 --->

<cfparam name="URL.object_type" default="PROCEDURE">
<cfparam name="URL.name" default="PROCEDURE1">

<!--- <cfstoredproc procedure="DBMS_METADATA.GET_DDL" datasource="intranet" result="stResult" returncode="true">
	<cfprocparam type="in" value="#URL.object_type#" cfsqltype="CF_SQL_VARCHAR">
	<cfprocparam type="in" value="#URL.name#" cfsqltype="CF_SQL_VARCHAR">
	<cfprocresult name="qResult" resultset="1">
</cfstoredproc> --->

<cftry>
	<cfquery name="qResult" datasource="intranet" result="stResult">
		select DBMS_METADATA.GET_DDL(
			<cfqueryparam value="#URL.object_type#" cfsqltype="CF_SQL_VARCHAR">,
			<cfqueryparam value="#URL.name#" cfsqltype="CF_SQL_VARCHAR">
		) as ddl
		from dual
	</cfquery>
	<cfdump var="#stResult#" label="stResult">
	<cfdump var="#qResult#" label="qResult">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>
<hr/>
<cftry>
	<cfquery name="qResult" datasource="intranet" result="stResult">
		select DBMS_METADATA.GET_XML(
			<cfqueryparam value="#URL.object_type#" cfsqltype="CF_SQL_VARCHAR">,
			<cfqueryparam value="#URL.name#" cfsqltype="CF_SQL_VARCHAR">
		) as xml
		from dual
	</cfquery>
	<cfset xResult = xmlParse(qResult.xml[1])>
	<cfdump var="#stResult#" label="stResult">
	<cfdump var="#xResult#" label="xResult">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>