<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", /*"Rāpare",*/ "Rāmere", "Rāhoroi", "Rātapu");
daysOfWeek.insertAt(4, "Rāpare");
writeDump(daysOfWeek);
</cfscript>