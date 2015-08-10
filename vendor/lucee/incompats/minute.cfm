<cfscript>
// minute.cfm

timeNow = now();

timezoneInfo = getTimezoneInfo();
timeZoneOffsetSign = sgn(timezoneInfo.utcTotalOffset) > 0 ? "+" : "";
timeZoneOffsetHours = timezoneInfo.utcTotalOffset / 3600;
timezoneOffsetLabel = "UTC#timeZoneOffsetSign##timeZoneOffsetHours#";
writeOutput("Local TZ offset: #timezoneOffsetLabel#<br>");
writeOutput("Timezone offset from Java: #timeNow.getTimezoneOffset()#<br>");

writeOutput("Raw time now: #timeNow#<br>");
writeOutput("Minutes now (#timezoneOffsetLabel#): #timeNow.minute()#<br>");

testTimezone = "Pacific/Chatham";
writeOutput("Minutes now (#testTimezone#): #timeNow.minute(testTimezone)#<br>");

</cfscript>