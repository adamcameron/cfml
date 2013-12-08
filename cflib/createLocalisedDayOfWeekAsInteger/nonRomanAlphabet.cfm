<cfscript>
// nonRomanAlphabet.cfm
include "createLocalisedDayOfWeekAsInteger.cfm";
daysInEn = createDaysArrayInLocale("en_nz");

for (locale in ["ru_ru", "ja_jp", "ar_sa"]){
	daysInLocale = createDaysArrayInLocale(locale);
	LSDayOfWeekAsIntegerCF = createLocalisedDayOfWeekAsInteger(locale);
	LSDayOfWeekAsIntegerISO = createLocalisedDayOfWeekAsInteger(locale, true);
	writeOutput("<h3>#locale#</h3>");
	for (i=1; i <= 7; i++){
		writeOutput("#daysInLocale[i]# (#daysInEn[i]#): CF: #LSDayOfWeekAsIntegerCF(daysInLocale[i])#/ ISO: #LSDayOfWeekAsIntegerISO(daysInLocale[i])#<br>");
	}
}

function createDaysArrayInLocale(required string locale){
	var baseSunday = createDate(1972, 1, 30);
	var daysInLocale = [];
	for (var i=0; i < 7; i++){
		arrayAppend(daysInLocale, lsDateFormat(dateAdd("d", i, baseSunday), "dddd", locale));
	}
	return daysInLocale;
}
</cfscript>