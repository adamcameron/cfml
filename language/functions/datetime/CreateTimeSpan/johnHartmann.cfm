<cfscript>
	dt = createDateTime(2011, 12, 13, 14, 15, 16);
	ts = createTimeSpan(1, 2, 3, 4);

	writeOutput("dt: #dt#<br />");
	writeOutput("ts: #ts#<br />");
	
	dtAsDouble = dt + ts;
	dtAsDateTime = createOdbcDateTime(dt + ts);

	writeOutput("As a double: #dtAsDouble# => #dateFormat(dtAsDouble, 'YYYY-MM-DD')# #timeFormat(dtAsDouble, 'HH:MM:SS')#<br />");
	writeOutput("As a date/time: #dtAsDateTime#<br />");
</cfscript>