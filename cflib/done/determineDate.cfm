<cfscript>
/*
 * @hint Convert relative date to a coldfusion date
 * @param relDate	   Relative dates must contain value and period pairs;
						The Value must must be an integer. (positive, to get dates in the future; negative, to get dates in the past);
						Valid periods are:
						"y" for years, "m" for months, "w" for weeks, "d" for days,
						"h" for hours, "n" for minutes and "s" for seconds;
						For example, "+1m +7d" represents one month and seven days from today.. (Required)
 * @param refDate	   The date of reference;
						Date/time object, in the range 100 AD–9999 AD.
 * @return Returns a coldfusion date
 * @author Loic Mahieu (loic@igloo.be)
 * @version 1, 2012-01-10
 */
function determineDate(required string offset, date refDate = now()) {
	var matcher = createObject("java", "java.util.regex.Pattern")
		.compile("([+\-]?[0-9]+)\s*(l|L|s|S|n|N|h|H|d|D|w|W|m|M|y|Y)")
		.matcher(javaCast("string", offset));

	while( matcher.find() ) {
		var match = matcher.group(1);
		var datePart = matcher.group(2);

		if( datePart == 'y' ) datePart = 'yyyy';
		else if( datePart == 'w' ) datePart = 'ww';

		refDate = dateAdd(datePart, match, refDate);
	}

	return refDate;
}
function determineDate2(required string offset, date refDate = now()) {
	var matcher = createObject("java", "java.util.regex.Pattern")
		.compile("(?i)([+-]?[0-9]+)\s*([snhdwmy])")
		.matcher(offset);

	while (matcher.find()) {
		var match = matcher.group(1);
		var datePart = matcher.group(2);

		if (datePart == "y"){
			datePart = "yyyy";
		}
		else if (datePart == "w"){
			datePart = "ww";
		}
		refDate = dateAdd(datePart, match, refDate);
	}
	return refDate;
}
</cfscript>

<cfoutput>
	<cfset date = now()>
	#date#<br />
	<cfloop index="mask" array="#['1D', '1Y', '1M1D', '1H2N3S', '-43Y0M+10D']#">
		<cfset d1 = determineDate(mask, date)>
		<cfset d2 = determineDate2(mask, date)>
		determineDate("#mask#"): #d1#: #d2# #dateCompare(d1,d2)#<br />
	</cfloop>
</cfoutput>