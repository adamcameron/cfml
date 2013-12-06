<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rātū", "Rāhina","Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"); //  "Rātū",  and Rāhina in the wrong order
daysOfWeek.swap(1, 2);
writeDump(daysOfWeek);
</cfscript>