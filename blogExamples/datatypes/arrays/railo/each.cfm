<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array("Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu");

daysOfWeek.each(
	function(element){
		param name="i" default=1;
		writeOutput("#i++# #uCase(element)#<br />");
	}
);
</cfscript>