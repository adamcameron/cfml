<cfparam name="URL.search" default="mno">

<cf_timeit>
<cfquery name="qAll" datasource="uhweb">
	select	*
	from	tbl_test_qoq
</cfquery>
</cf_timeit>

<cf_timeit>
<cfloop index="i" from="1" to="50">
	<cfquery name="qFetch" dbtype="query">
		select	*
		from	qAll
		where	qoq_data like '%#URL.search#%'
	</cfquery>
</cfloop>
</cf_timeit>