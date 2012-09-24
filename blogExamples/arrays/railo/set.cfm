<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina");
daysOfWeek[7] = "Rātapu";

daysOfWeek.set(3, 5, "FILLER");

writeDump(daysOfWeek);	
</cfscript>