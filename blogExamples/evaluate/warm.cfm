<cfscript>
	writeDump(var="#structKeyArray(application)#", top="10");
	writeLog(file="#application.applicationname#_control", text="Warmed");
</cfscript>