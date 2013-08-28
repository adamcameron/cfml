<cfscript>
for (locale in ["english (uk)", "english (us)"]){
	setLocale(locale);
	writeOutput("<h3>#getLocale()#</h3>");

	datesTable(["30/2/13","30 February 13"]);
	writeOutput("<br>");
	datesTable(["28/2/13","28 February 13"]);
	writeOutput("<hr>");
}

public void function datesTable(dates){
	writeOutput('<table border="1"><thead><tr><th>Raw</th><th>parsed</th><th>locale-aware parsed</th></tr></thead><tbody>');
	for (date in dates) {
		writeOutput("<tr><td>#date#</td>");
		if (isValid("date", date)){
			writeOutput("<td>#parseDateTime(date)#</td>");
		}else{
			writeOutput("<td>-</td>");
		}
		if (isValidDateForCurrentLocale(date)){
			writeOutput("<td>#parseDateTimeForCurrentLocale(date)#</td>");
		}else{
			writeOutput("<td>-</td>");
		}
		writeOutput("</tr>");
	}
	writeOutput('</tbody></table>');
}


public boolean function isValidDateForCurrentLocale(required string date){
	var locale = getLocale();
	var validator = "eurodate";
	if (locale == "english (us)"){
		validator = "date";		
	}
	return isValid(validator, date);
}

public date function parseDateTimeForCurrentLocale(required string date){
	var locale = getLocale();
	if (locale == "english (us)"){
		return parseDateTime(date);		
	}else{
		return lsParseDateTime(date);		
	}
}
</cfscript>