<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");
writeDump(daysOfWeek);

numbers = array(1, array(2, "two"), array(3, array("three", "toru")));
writeDump(numbers);

daysOfWeek = array(monday="Rāhina", tuesday="Rātū", wednesday="Rāapa", thursday="Rāpare", friday="Rāmere", saturday="Rāhoroi", sunday="Rātapu");
writeDump(daysOfWeek);
</cfscript>

