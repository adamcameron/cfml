<cfscript>
function getTimeInterval(date){
	var interval	= "";
	var offset		= 0;
	var result		= 0;
	if (isDate(arguments.date)){
		var formattedDate = dateFormat(arguments.date, "dddd dd mmmm yyyy") & " at " & timeFormat(arguments.date, "HH:MM");
		
		if (dateDiff("s", arguments.date, now()) < 60){
			// less than 1 minute show interval in seconds
			offset	= dateDiff("s", arguments.date, now());
			interval= offset == 1 ? "second":"seconds";
			result	= "#offset# #interval# ago";
		
		}else if (dateDiff("n", arguments.date, now()) < 60){
			// less than 1 hour show interval in minutes
			offset	= dateDiff("n", arguments.date, now());
			interval= offset == 1 ? "minute":"minutes";
			result	= "#offset# #interval# ago";
		
		}else if (dateDiff("h", arguments.date, now()) < 24){
			// less than 24 hours display interval in hours
			offset	= dateDiff("h", arguments.date, now());
			interval= offset == 1 ? "hour":"hours";
			result	= "#offset# #interval# ago";
		
		}else if (dateDiff("d", arguments.date, now()) < 2){
			// less than 2 days display yesterday
			result	= "yesterday";
		}else if (dateDiff("d", arguments.date, now()) < 7){
			// less than 7 days display day
			result	= dayOfWeekAsString( dayOfWeek( arguments.date ));
		}else{
			// otherwise display date
			result	= formattedDate;
		}
		
		interval = "<abbr title='" & formattedDate & "'>" & result & "</abbr>";
	}
	return interval;
}
</cfscript>
