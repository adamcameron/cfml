<cfflush interval="64">
<cfparam name="URL.dsn" type="string">

<cftry>
	Dropping table&hellip;
	<cfquery datasource="#URL.dsn#">
		drop table tbl_loremipsum
	</cfquery>
	dropped
	<cfcatch>
		<cfoutput>failed (#cfcatch.message# #cfcatch.detail#)</cfoutput>
	</cfcatch>
</cftry>
<br />
Create table&hellip
<cfquery datasource="#URL.dsn#">
	create table tbl_loremipsum(
		lor_id		integer NOT NULL,
		lor_text	ntext  NOT NULL,
 		constraint pk_loremipsum primary key clustered (
			lor_id ASC
		) on [primary]
	)
</cfquery>
created<br />
Reading data&hellip;
<cffile action="read" file="#expandPath('./data.xml')#" variable="wOut">
<cfwddx action="wddx2cfml" input="#wOut#" output="qOut">
read<br />

Loading data&hellip;
<cfloop query="qOut">
	<cfquery datasource="#URL.dsn#">
		insert into tbl_loremipsum (
			lor_id, lor_text
		) values (
			<cfqueryparam value="#lor_id#" cfsqltype="CF_SQL_INTEGER">,
			<cfqueryparam value="#lor_text#" cfsqltype="CF_SQL_LONGVARCHAR">
		)
	</cfquery>
	.
</cfloop>
Loaded<br />
