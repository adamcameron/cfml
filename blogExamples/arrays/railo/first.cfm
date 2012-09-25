<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");

results.first = daysOfWeek.first();
results.last = daysOfWeek.last();
results.mid = daysOfWeek.mid(2,5);
writeDump(results);
</cfscript>