<cfscript>
// dayOfWeekAsInt.cfm
numeric function dayOfWeekAsInteger(required string day){
	var days = "Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday";
	var index = listFindNoCase(days, day);
	if (index){
		return index;
	}else{
		throw(type="ArgumentOutOfRangeException", message="Invalid day value", details="day argument value must be one of #days#");
	}
}
</cfscript>