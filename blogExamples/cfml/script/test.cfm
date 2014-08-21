<cfscript>
// test.cfm

try {
	fileHandle = fileOpen(expandPath("./data.txt"), "append");
	fileWrite(fileHandle, "first");
	fileWrite(fileHandle, "second");
}
catch (any e){
	writeDump(e);
}
finally{
	try {
		fileClose(fileHandle);
	}
	catch (any ignore){}
}
</cfscript>