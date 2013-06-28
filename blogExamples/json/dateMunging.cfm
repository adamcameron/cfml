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

	sql = "
		SELECT	*
		FROM	dates
		WHERE	dob > '1958-10-18'
	";
	filteredDates = new Query(
		dbtype	="query",
		sql		= sql,
		dates	= dates
	).execute().getResult();

	json = serializeJson(dates, true);
	deserialised = deserializeJson(json, false);

	filteredDeserialisedDates = new Query(
		dbtype	="query",
		sql		= sql,
		dates	= deserialised
	).execute().getResult();

	writeDump([
		dates,
		filteredDates,
		json,
		deserialised,
		filteredDeserialisedDates
	]);
</cfscript>