<cfscript>
	dates = queryNew("");
	queryAddColumn(dates, "id", [1,2,3,4,5,6,7]);
	queryAddColumn(dates, "dob", [
		createDate(1933,2,20),
		createDate(1933,11,6),
		createDate(1959,9,1),
		createDate(1961,7,12),
		createDate(1970,2,17),
		createDate(1990,10,5),
		createDate(2011,3,24)
	]);

	json = serializeJson(dates, true);
	deserialised = deserializeJson(json, false);
</cfscript>
<cfquery name="filteredDates" dbtype="query">
	SELECT	*
	FROM	dates
	WHERE	dob > <cfqueryparam value="#createDate(1958,10,18)#" cfsqltype="CF_SQL_TIMESTAMP">
</cfquery>
<cfquery name="filteredDeserialisedDates" dbtype="query">
	SELECT	*
	FROM	deserialised
	WHERE	dob > <cfqueryparam value="#createDate(1958,10,18)#" cfsqltype="CF_SQL_TIMESTAMP">
</cfquery>

<cfdump var="#[
	dates,
	filteredDates,
	json,
	deserialised,
	filteredDeserialisedDates
]#">

<cfoutput>
Value: #deserialised.dob[1]#<br>
isDate: #isDate(deserialised.dob[1])#<br>
dateAdd: #dateAdd("d", 0, deserialised.dob[1])#<br>
</cfoutput>
