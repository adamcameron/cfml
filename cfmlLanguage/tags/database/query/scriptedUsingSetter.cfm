<cfscript>
	q	= new Query(
		datasource	= "scratch",
		sql			= "select * from tbl_colour where clr_id between :firstColour and :lastColour",
		maxrows		= 4,
		cachedWithin= createTimeSpan(0, 0, 10, 0),
		parameters	= [
			{name="firstColour", value=3, cfsqltype="CF_SQL_INTEGER"},
			{name="lastColour", value=6, cfsqltype="CF_SQL_INTEGER"}
		]
	).execute();
	dump(var=q);

</cfscript>
