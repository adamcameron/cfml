<cfscript>
	q	=	new Query(
		datasource	= "scratch",
		sql			= "select * from tbl_colour",
		maxrows		= 4,
		cachedWithin= createTimeSpan(0, 0, 10, 0)
	).execute();
	dump(var=q);
</cfscript>
