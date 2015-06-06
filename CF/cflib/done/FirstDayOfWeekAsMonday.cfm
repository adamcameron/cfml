<cfscript>
/**
 * Determines the first day of the week (Monday as opposed to Sunday).
 * 
 * @param Week		The Week of the year you want to determine. Defaults to Now() (the current week). (required)
 * @param Week		The Year of the week you want to determine. Defaults to Now() (the current year). (required)
 * 
 * @author		Peter Tilbrook (peter.tilbrook@coldgen.com); 
 * @version		1.0 (October 18, 2012)
 */
public string function firstDayOfWeekAsMonday() {
	var Week=Week(Now());
	var Year=Year(Now());
	FirstDay=Year & "-01-01";
	NewDay=DateAdd("ww",Week-1, FirstDay);
	NTM=(DayOfWeek(NewDay)-2)*-1;
	NewDay=DateAdd("d", NTM, NewDay);
	return NewDay;
}
</cfscript>	