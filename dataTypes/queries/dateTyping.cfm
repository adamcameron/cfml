<cfscript>
	qGirl = QueryNew("name, date", "VARCHAR, VARCHAR");

	QueryAddRow(qGirl, 3);

	qGirl["name"][1] = JavaCast("string", "Libby");
	qGirl["date"][1] = JavaCast("string", "2006-10-01");

	qGirl["name"][2] = JavaCast("string", "Sarah");
	qGirl["date"][2] = JavaCast("string", "2006-09-01");

	qGirl["name"][3] = JavaCast("string", "Cindy");
	qGirl["date"][3] = JavaCast("string", "2006-08-01");
</cfscript>

<cfquery name="qFirstGirl" dbtype="query">
	SELECT	name, [date]
	FROM	qGirl
	WHERE	[date] = <cfqueryparam value="#qGirl.date[1]#"	cfsqltype="CF_SQL_TIMESTAMP">
</cfquery>

<cfdump var="#qFirstGirl#">