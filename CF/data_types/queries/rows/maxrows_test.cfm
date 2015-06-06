<h1>All Records</h1>
<cf_timeit>
<cfquery name="getRecords" datasource="hnzc">
	select	*
	from	page_groups
	where	'#createUUID()#' <> '#createUUID()#'
</cfquery>
</cf_timeit>
<cfoutput>
getResults.recordCount: #getRecords.recordCount#<br />
getRecords.getRecordCount(): #getRecords.getRecordCount()#<br />
</cfoutput>

<h1>maxrows</h1>
<cf_timeit>
<cfquery name="getRecords" datasource="hnzc" maxrows="100000">
	select	*
	from	page_groups
	where	'#createUUID()#' <> '#createUUID()#'
</cfquery>
</cf_timeit>
<cfoutput>
getResults.recordCount: #getRecords.recordCount#<br />
getRecords.getRecordCount(): #getRecords.getRecordCount()#<br />
</cfoutput>


<h1>rownum</h1>
<cf_timeit>
<cfquery name="getRecords" datasource="hnzc">
	select	*
	from	page_groups
	where	'#createUUID()#' <> '#createUUID()#'
	and rownum <= 100000
</cfquery>
</cf_timeit>
<cfoutput>
getResults.recordCount: #getRecords.recordCount#<br />
getRecords.getRecordCount(): #getRecords.getRecordCount()#<br />
</cfoutput>
