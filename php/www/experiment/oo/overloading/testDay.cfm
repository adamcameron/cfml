<cfprocessingdirective pageencoding="utf-8">
<cfscript>
// testDay.cfm

day = new Day();
day.english	= "Tuesday";
day.maori	= "Rātū";
day.japanese= "火曜日";

writeDump(day);
</cfscript>