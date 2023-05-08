<cfprocessingdirective pageencoding="utf-8">
<cfscript>
daysOfWeek = array();
daysOfWeek[2] = "Rāhina";

for (i=1; i <= 3; i++){
	try {
		writeOutput("#i#: #daysOfWeek.isDefined(i)#<br />");
	} catch (any e){
		writeDump(e);
	}
}
</cfscript>