<cfscript>
string function getIsoTimeString(required date datetime, boolean convertToUTC=true) {
	if (convertToUTC) {
		datetime = dateConvert("local2utc", datetime);
	}

	// When formatting the time, make sure to use "HH" so that the
	// time is formatted using 24-hour time.
	return(
		dateFormat(datetime, "yyyy-mm-dd") &
		"T" &
		timeFormat(datetime, "HH:mm:ss") &
		"Z"
	);
}

currentTime = now();

// Compare the HTTP time to the ISO time.
writeOutput( "HTTP Time: " & getHttpTimeString( currentTime ) );
writeOutput( "<br />" );
writeOutput( "ISO Time: " & getIsoTimeString( currentTime ) );
</cfscript>