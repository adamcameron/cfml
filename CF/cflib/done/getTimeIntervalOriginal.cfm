<cfflush>
<cfscript>
function getTimeInterval( date )
{
	var interval = "";
	if( IsDate( arguments.date ) )
	{
		var formatteddate = DateFormat( arguments.date, "dddd dd mmmm yyyy" ) & " at " & TimeFormat( arguments.date, "HH:MM" );
		// less than 1 minute show interval in seconds
		if( DateDiff( "s", arguments.date, Now() ) < 60 )
			interval = DateDiff( "s", arguments.date, Now() ) & " seconds ago";
		// less than 1 hour show interval in minutes
		else if( DateDiff( "n", arguments.date, Now() ) < 60 )
			interval = DateDiff( "n", arguments.date, Now() ) & " minutes ago";
		// less than 24 hours display interval in hours
		else if( DateDiff( "h", arguments.date, Now() ) < 24 )
			interval = DateDiff( "h", arguments.date, Now() ) & " hours ago";
		// less than 2 days display yesterday
		else if( DateDiff( "d", arguments.date, Now() ) < 2 )
			interval = "yesterday";
		// less than 7 days display day
		else if( DateDiff( "d", arguments.date, Now() ) < 7 )
			interval = DayOfWeekAsString( DayOfWeek( arguments.date ) );
		// otherwise display date
		else
			interval = formatteddate;
		interval = "<abbr title='" & formatteddate & "'>" & interval & "</abbr>";
	}
	return interval;
}



tsStart = now();
for (i=0; i <= 336; i++){
	writeOutput(getTimeInterval(dateAdd("h", -i, tsStart)) & "<br />");

	
}
</cfscript>
