<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");
writeDump(var=daysOfWeek, label="Original data");

new = daysOfWeek.slice(2, 3);
writeDump(var=new, label="2,3,4 (Rātū-Rāpare)");

new = daysOfWeek.slice(4);
writeDump(var=new, label="4- (Rāpare-Rātapu)");

new = daysOfWeek.slice(-5, 3); 
writeDump(var=new, label="2,3,4 (Rātū-Rāmere)");
</cfscript>