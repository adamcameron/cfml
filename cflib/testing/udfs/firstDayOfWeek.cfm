<cfscript>
/**
* Analogous to firstDayOfMonth() function.
* 
* @param date      Date object used to figure out week. (Required)
* @return Returns a date. 
* @author Pete Ruckelshaus (pruckelshaus@yahoo.com) 
* @version 1, September 12, 2007 
*/
function firstDayOfWeekOld() {
	var dow = "";
	var dowMod = "";
	var dowMult = "";
	var firstDayOfWeek = "";
	if(arrayLen(arguments) is 0) arguments.date = now();
	date = trim(arguments.date);
	dow = dayOfWeek(date);
	dowMod = decrementValue(dow);
	dowMult = dowMod * -1;
	firstDayOfWeek = dateAdd("d", dowMult, date);

	return firstDayOfWeek;
}

date function firstDayOfWeek(date date=now()){
	return dateAdd("d", -(dayOfWeek(date)-1), date);
}

</cfscript>
