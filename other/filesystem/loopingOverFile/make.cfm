<!--- make.cfm --->
<cfflush interval="16">
<cfscript>
	CRLF = chr(13) & chr(10);
	try {
		filePath = expandPath("./data.txt");
		fileHandle = fileOpen(filePath, "append");
		for (row=1; row <= 1024 * 1024; row++){ // 2 "million" rows
			kb = "";
			for (i=1; i <= 32; i++){
				kb &= replace(createUuid(), "-", "", "ALL");
			}
			kb = left(kb, 1022) & CRLF; // 1kB rows
			fileWrite(fileHandle, kb);
			if (!row MOD 500){
				writeOutput("."); // a progress indicator
				if (!row MOD 20000){
					writeOutput("<br>");
				}
			}
		}
	} finally {
		fileClose(fileHandle);
	}
</cfscript>