<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");

matches = daysOfWeek.filter(
	function(element){
		return reFindNoCase("^Rāt", element);
	}
);
writeDump(var=matches);
</cfscript>