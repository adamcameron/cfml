<cfscript>
	q1	=	new Query(
		datasource	= "scratch",
		sql			= "select top 4 * from tbl_colour",
		maxrows		= 4,
		cachedwithin= createTimeSpan(0, 0, 10, 0)
	).execute();
	dump(var=q1);
</cfscript>

<cfquery name="q2" datasource="scratch" maxrows="4" cachedWithin="#createTimeSpan(0, 0, 10, 0)#">
	select top 4 * from tbl_colour
</cfquery>
<cfdump var="#q2#">