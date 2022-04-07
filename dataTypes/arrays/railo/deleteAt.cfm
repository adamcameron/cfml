<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"); // Rāpare is duplicated
daysOfWeek.deleteAt(4);
writeDump(daysOfWeek);
</cfscript>