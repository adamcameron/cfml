<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāpare");	// Thursday
daysOfWeek.prepend("Rāapa");	// Wednesday
daysOfWeek.append("Rāmere");	// Friday
daysOfWeek.prepend("Rātū");		// Tuesday
daysOfWeek.append("Rāhoroi");	// Saturday
daysOfWeek.prepend("Rāhina");	// Monday
daysOfWeek.append("Rātapu");	// Sunday
writeDump(daysOfWeek);
</cfscript>