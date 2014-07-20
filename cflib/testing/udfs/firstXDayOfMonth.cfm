<cfscript>
	
function FirstXDayOfMonthOld(day_number,month_number,year) {
	var start_of_month = CreateDate(year,month_number,1);  // date object of first day for given month/year
	var daydiff = DayOfWeek(start_of_month) - day_number;
	var return_date = "";
	switch(daydiff) {
		case "-1": return_date = DateAdd("d",1,start_of_month); break;
		case "6": return_date = DateAdd("d",1,start_of_month); break;
		case "-2": return_date = DateAdd("d",2,start_of_month); break;
		case "5": return_date = DateAdd("d",2,start_of_month); break;
		case "-3": return_date = DateAdd("d",3,start_of_month); break;
		case "4": return_date = DateAdd("d",3,start_of_month); break;
		case "-4": return_date = DateAdd("d",4,start_of_month); break;
		case "3": return_date = DateAdd("d",4,start_of_month); break;
		case "-5": return_date = DateAdd("d",5,start_of_month); break;
		case "2": return_date = DateAdd("d",5,start_of_month); break;
		case "-6": return_date = DateAdd("d",6,start_of_month); break;
		case "1": return_date = DateAdd("d",6,start_of_month); break;
		default: return_date = start_of_month; break;  // daydiff=0, default to first day in current month
	} //end switch
	return return_date;
}

function firstXDayOfMonthUnsafe(day_number,month_number,year) {
	var start_of_month = createDate(year,month_number,1);  // date object of first day for given month/year
	var daydiff = dayOfWeek(start_of_month) - day_number;
	var transformationMap = {
		"-1" = 1,	6 = 1,
		"-2" = 2,	5 = 2,
		"-3" = 3,	4 = 3,
		"-4" = 4,	3 = 4,
		"-5" = 5,	2 = 5,
		"-6" = 6,	1 = 6
	};
	return structKeyExists(transformationMap, daydiff) ? dateAdd("d", transformationMap[daydiff], start_of_month) : start_of_month;
}

function firstXDayOfMonthMap(day_number,month_number,year) {
	if (day_number < 1 || day_number > 7){
		throw(type="InvalidDayOfWeekException", message="Invalid day of week value", detail="the dayOfWeek argument must be between 1-7 (inclusive).");
	}
	var start_of_month = createDate(year,month_number,1);  // date object of first day for given month/year
	var daydiff = dayOfWeek(start_of_month) - day_number;
	var transformationMap = {
		"-1" = 1,	6 = 1,
		"-2" = 2,	5 = 2,
		"-3" = 3,	4 = 3,
		"-4" = 4,	3 = 4,
		"-5" = 5,	2 = 5,
		"-6" = 6,	1 = 6,
					0 = 0
	};
	return dateAdd("d", transformationMap[daydiff], start_of_month);
}

date function firstXDayOfMonth(required numeric dayOfWeek, required numeric month, required numeric year){
	if (dayOfWeek < 1 || dayOfWeek > 7){
		throw(type="InvalidDayOfWeekException", message="Invalid day of week value", detail="the dayOfWeek argument must be between 1-7 (inclusive).");
	}
	var firstOfMonth	= createDate(year, month,1);
	var dowOfFirst		= dayOfWeek(firstOfMonth);
	var daysToAdd		= (7 - (dowOfFirst - dayOfWeek)) MOD 7;
	var dow = dateAdd("d", daysToAdd, firstOfMonth);
	return dow;
}


</cfscript>