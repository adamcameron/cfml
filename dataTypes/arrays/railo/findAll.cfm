<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");

daysOfWeek.append("RĀMERE"); // append another "similar" entry, but we expect not to match it due to doing a case-senstive match
matches = daysOfWeek.findAll(
	function(element){
		return !compare(element, "Rāmere");	// but it's up to our callback to determine whether it's case-sensitive!
	}
);
writeDump(var=matches, label='daysOfWeek.findAll("Rāmere")');

daysOfWeek.append("RĀHOROI");	// append another "similar" entry. We DO expect to match it due to doing a case-insenstive match
matches = daysOfWeek.findAllNoCase(
	function(element){
		return element == "RĀHOROI";	// shoud be case-insensitive
	}
);

writeDump(var=matches, label='daysOfWeek.findAllNoCase("RĀHOROI")');

writeDump(daysOfWeek);
</cfscript>