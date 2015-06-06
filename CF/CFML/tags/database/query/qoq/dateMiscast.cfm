<cfscript>
	q1 = queryNew("id,col1,col2", "CF_SQL_INTEGER,CF_SQL_VARCHAR,CF_SQL_VARCHAR");

	queryAddRow(q1);
	querySetCell(q1, "id", "1");

	// normal assignment
	//	querySetCell(q1, "col1", "1212-77-01");
	//	querySetCell(q1, "col2", "1212-77-01");

	// javaCast() assignment
	querySetCell(q1, "col1", javaCast("string", "1212-77-01"));
	querySetCell(q1, "col2", javaCast("string", "1212-77-01"));


	querySetCell(q1, "id", "2");
	querySetCell(q1, "col1", "1212-77-01DEFINITELY_NOT_A_DATE");
	querySetCell(q1, "col2", "1212-77-01DEFINITELY_NOT_A_DATE");


	// desired assignment
	sCol1 = javaCast("string", "1212-77-01");
	sCol2 = javaCast("string", "1212-77-01");

	// alternate assignment, definitely cannot be interpretted as strings
	// uncomment to run second test
	// sCol1 = javaCast("string", "1212-77-01DEFINITELY_NOT_A_DATE");
	// sCol2 = javaCast("string", "1212-77-01DEFINITELY_NOT_A_DATE");
</cfscript>

<cftry>
	CFQUERYPARAM<br />
	<cfquery dbtype="query" name="q2">
	SELECT *
	FROM q1
	WHERE col1 = <cfqueryparam value="#sCol1#" cfsqltype="CF_SQL_VARCHAR">
	   or col2 = <cfqueryparam value="#sCol2#" cfsqltype="CF_SQL_VARCHAR">
	</cfquery>
	<cfdump var="#q2#">
	<cfcatch>
		<cfdump var="#cfcatch#" expand="false">
	</cfcatch>
	<cffinally>
	woohoo!
	</cffinally>
</cftry>

<cftry>
	Cast() on both sides<br />
	<cfquery dbtype="query" name="q2">
	SELECT *
	FROM q1
	WHERE cast(col1 as varchar) = cast('#sCol1#' as varchar)
	   or cast(col2 as varchar) = cast('#sCol2#' as varchar)
	</cfquery>
	<cfdump var="#q2#">
	<cfcatch>
		<cfdump var="#cfcatch#" expand="false">
	</cfcatch>
</cftry>

<cftry>
	Static values<br />
	<cfquery dbtype="query" name="q2">
	SELECT *
	FROM q1
	WHERE col1 = '#sCol1#'
	   or col2 = '#sCol2#'
	</cfquery>
	<cfdump var="#q2#">
	<cfcatch>
		<cfdump var="#cfcatch#" expand="false">
	</cfcatch>
</cftry>
