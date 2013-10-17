<cfscript>
private date function composeDateTime(date date=now(), numeric year, numeric month, numeric day, numeric hour, numeric minute, numeric second){
	param name="arguments.year" default=year(date);
	param name="arguments.month" default=month(date);
	param name="arguments.day" default=day(date);
	param name="arguments.hour" default=hour(date);
	param name="arguments.minute" default=minute(date);
	param name="arguments.second" default=second(date);

	return createDateTime(arguments.year, arguments.month, arguments.day, arguments.hour, arguments.minute, arguments.second);
}


defaultsWereSet = composeDateTime();
justYearWasSet = composeDateTime(2011); // all other components use either now() or 0/1 as most appropriate (probably the former)
monthWasSetToo = composeDateTime(2011, 3);
dayWasSetToo = composeDateTime(2011, 3, 24);
hourWasSetToo = composeDateTime(2011, 3, 24, 9);
minWasSetToo = composeDateTime(2011, 3, 24, 9, 30);
secWasSetToo = composeDateTime(2011, 3, 24, 9, 30, 00);
writeDump(variables);
</cfscript>