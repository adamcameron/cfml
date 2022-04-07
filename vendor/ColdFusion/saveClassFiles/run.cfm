<cfflush interval="16">
<cfscript>
	files = directoryList(expandPath("./api"), false);
	filesLen = arrayLen(files);
	
	start = getTickCount();
	for (i=1; i <= filesLen; i++){
		fileName = listLast(files[i], "\");
		cfcName = listFirst(fileName, ".");
		o = createObject("api.#cfcName#");
		writeOutput("#i#/#filesLen# #getMetadata(o).fullName#<br>");
	}
	end = getTickCount();
	runningTime = end - start;
	writeOutput("Running time: #runningTime#ms to load #arrayLen(files)# objects");
</cfscript>