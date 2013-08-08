<cfscript>
	writeDump(var=application, top=100);
	writeLog(file="#application.applicationname#_control", text="Warmed");
</cfscript>