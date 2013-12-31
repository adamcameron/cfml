<cfscript>
// toCfcs.cfm
CRLF = chr(13) & chr(10);

baseDir = expandPath("../");
cfcDir = baseDir & "cfcs/";
libs = directoryList(baseDir, false, "array", "*.cfm", "name asc");
for (filePath in libs){
	code = fileRead(filePath, "UTF-8");
	code = "<cfcomponent>#CRLF##CRLF#" & code & "#CRLF##CRLF#</cfcomponent>";	
	fileName = listLast(filePath, "\/");
	cfcName = reReplaceNoCase(fileName, "m$", "c", "ONE");
	cfcPath = cfcDir & cfcName;
	writeDump([filePath,fileName,cfcPath]);
	//continue;
	fileWrite(cfcPath, code, "UTF-8");
}
</cfscript>