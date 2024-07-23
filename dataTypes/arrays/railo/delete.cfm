<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "DELETEME", "Rātū", "DELETEME", "Rāapa", "DELETEME", "Rāpare", "DELETEME", "Rāmere", "DELETEME", "Rāhoroi", "DELETEME", "Rātapu", "DELETEME");

daysOfWeek.delete("DELETEME", "ALL");
writeDump(daysOfWeek);
</cfscript>