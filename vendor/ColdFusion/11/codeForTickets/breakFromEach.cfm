<cfprocessingdirective pageencoding="UTF-8">
<cfscript>
// breakFromEach.cfm
week = ["Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"];
week.each(function(v,i){
	writeOutput("#v#<br>");
	if (i > 3) break;
});
</cfscript>