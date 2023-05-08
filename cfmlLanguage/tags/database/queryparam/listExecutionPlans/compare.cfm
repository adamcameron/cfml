<cfset l = "">
<cfloop index="i" from="1" to="500">
	<cfset l = listAppend(l, i)>
</cfloop>


<cfquery name="q" datasource="mysite">
	select	*
	from	tbl_loremipsum
	where	lor_id in (#l#)
</cfquery>

<cfquery name="q" datasource="mysite">
	select	*
	from	tbl_loremipsum
	where	lor_id in (<cfqueryparam value="#l#" cfsqltype="cf_sql_integer" list="true">)
</cfquery>

<cfquery name="q" datasource="mysite">
	select	*
	from	tbl_loremipsum
	where	lor_id in (
		select	lor_id
		from	tbl_loremipsum
		where	lor_id <= <cfqueryparam value="#500#" cfsqltype="cf_sql_integer">
	)
</cfquery>


<cfquery name="q" datasource="mysite">
	select	*
	from	tbl_loremipsum
	inner join (
		select	lor_id
		from	tbl_loremipsum
		where	lor_id <= <cfqueryparam value="#500#" cfsqltype="cf_sql_integer">
	) rows on tbl_loremipsum.lor_id = rows.lor_id
</cfquery>