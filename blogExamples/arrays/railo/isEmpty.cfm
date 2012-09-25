<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");
writeOutput("daysOfWeek.isEmpty: #daysOfWeek.isEmpty()#<br />");

daysOfWeek.clear();
writeOutput("daysOfWeek.isEmpty() after daysOfWeek.clear(): #daysOfWeek.isEmpty()#<br />");
</cfscript>