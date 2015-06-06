<cfset variables.dsn = "junk_mssql">
<cfflush interval="20">
<cfoutput>
<!---<cfloop index="i" from="1" to="4500">
	<cfquery name="q" datasource="#variables.dsn#">
		insert into table1(t1_label) values (<cfqueryparam cfsqltype="cf_sql_varchar" value="T1 Label #i#">)
	</cfquery>
	Inserted [#i#]<br />
	<cfquery name="qId" datasource="#variables.dsn#">
		select max(t1_id) as max_id from table1
	</cfquery>
	<cfloop index="j" from="1" to="100">
		<cfquery name="q" datasource="#variables.dsn#">
			insert into table2(t2_label, t1_id) values (<cfqueryparam cfsqltype="cf_sql_varchar" value="T2 Label #j#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#qId.max_id[1]#">)
		</cfquery>
	</cfloop>
</cfloop>
 --->

<cfif structKeyExists(URL, "compile") and URL.compile>
	Compiled
	<cfabort>
</cfif>

WHERE<br />
<cf_timeit>
<cfquery name="qWhere" datasource="#variables.dsn#">
	select	count(t2_id) as count_id
	from	table1 t1, table2 t2
	where	t1.t1_id = t2.t1_id
	and		'#createUuid()#' <> '#createUuid()#'
</cfquery>
</cf_timeit>

JOIN<br />
<cf_timeit>
<cfquery name="qJoin" datasource="#variables.dsn#">
	select	count(t2_id) as count_id
	from	table1 t1 inner join table2 t2
	on		t1.t1_id = t2.t1_id
	and		'#createUuid()#' <> '#createUuid()#'
</cfquery>
</cf_timeit>

WHERE<br />
<cf_timeit>
<cfquery name="qWhere" datasource="#variables.dsn#">
	select	count(t2_id) as count_id
	from	table1 t1, table2 t2
	where	t1.t1_id = t2.t1_id
	and		'#createUuid()#' <> '#createUuid()#'
</cfquery>
</cf_timeit>

JOIN<br />
<cf_timeit>
<cfquery name="qWhere" datasource="#variables.dsn#">
	select	count(t2_id) as count_id
	from	table1 t1 inner join table2 t2
	on		t1.t1_id = t2.t1_id
	and		'#createUuid()#' <> '#createUuid()#'
</cfquery>
</cf_timeit>

</cfoutput>