<cfflush interval="16">
<cfscript>
	files = directoryList(expandPath("./api"), false);

	start = getTickCount();
	for (filePath in files){
		fileName = listLast(filePath, "\");
		cfcName = listFirst(fileName, ".");
		o = createObject("api.#cfcName#");
		writeOutput(getMetadata(o).fullName & "<br>");
	}
	end = getTickCount();
	runningTime = end - start;
	writeOutput("Running time: #runningTime#ms to load #arrayLen(files)# objects");
</cfscript>