<cfscript>
// createLocalisedDayOfWeekAsInteger.cfm
function function createLocalisedDayOfWeekAsInteger(required string locale, boolean iso=false){
	var supportedLocales = SERVER.coldfusion.supportedLocales;
	if (!listFindNoCase(supportedLocales, locale)){
		throw(type="InvalidLocaleException", message="Invalid locale value specified", detail="Locale must be one of #supportedLocales#");
	}
	var baseDate = createDate(1972, 1, iso ? 31:30); // ie: in ISO mode, start on Mon. Otherwise CF mode: Sun
	var days = "";
	for (var i=0; i < 7; i++){
		days = listAppend(days, lsDateFormat(dateAdd("d", i, baseDate), "dddd", locale));
	}

	return function(required string day){
		var index = listFindNoCase(days, day);
		if (index){
			return index;
		}
		throw(type="ArgumentOutOfRangeException", message="Invalid day value", detail="day argument value (#day#) must be one of #days#");
	};
}	
</cfscript>