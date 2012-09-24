<cfprocessingdirective pageencoding="utf-8">
<cfscript>
	daysOfWeek = queryNew("");
	queryAddColumn(daysOfWeek, "id", [1,2,3,4,5,6,7]);
	queryAddColumn(daysOfWeek, "en", ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]);
	queryAddColumn(daysOfWeek, "mi", ["Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"]);
	
	writeDump(daysOfWeek);
</cfscript>