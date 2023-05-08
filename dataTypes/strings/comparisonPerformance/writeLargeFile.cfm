<cfscript>
	include "createString.cfm";
	fileWrite(expandPath("./data.txt"), s);
</cfscript>