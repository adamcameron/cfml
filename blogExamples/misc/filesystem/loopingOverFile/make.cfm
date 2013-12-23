<cfflush interval="16">
<cfscript>
	CRLF = chr(13) & chr(10);
	try {
		filePath = expandPath("./data_sml2.txt");
		fileHandle = fileOpen(filePath, "append");
		for (row=1; row <= 1024; row++){
			kb = "";
			for (i=1; i <= 32; i++){
				kb &= replace(createUuid(), "-", "", "ALL");
			}
			kb = left(kb, 1022) & CRLF;
			fileWrite(fileHandle, kb);
			if (!i MOD 500){
				writeOutput(".");
			}
		}
	} finally {
		fileClose(fileHandle);
	}
</cfscript>