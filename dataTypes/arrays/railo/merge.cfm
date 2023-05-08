<cfprocessingdirective pageencoding="utf-8">
<cfscript>
weekdays = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere");
weekend = array("Rāhoroi", "Rātapu");

daysOfWeek = weekdays.merge(weekend);
writeDump(var=daysOfWeek);
</cfscript>