<cfscript>
// minute.cfm

timeNow = now();

timeZoneInfo = getTimezoneInfo();
timeZoneOffsetSign = sgn(timezoneInfo.utcTotalOffset) > 0 ? "+" : "";
timeZoneOffsetHours = timezoneInfo.utcTotalOffset / 3600;
writeOutput("Local TZ offset: #timeZoneOffsetHours#<br>");
writeOutput("Timezone offset from Java: #timeNow.getTimezoneOffset()#<br>");

writeOutput("Raw time now: #timeNow#<br>");
writeOutput("Minutes now (System timezone): #timeNow.minute()#<br>");

testTimeZone = "Pacific/Chatham";
writeOutput("Minutes now (#testTimeZone#): #timeNow.minute(testTimeZone)#<br>");
</cfscript>