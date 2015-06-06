<cfscript>
	sBasePath = expandPath("./");
	oFile = createObject("java", "java.io.File").init(sBasePath);
	aFiles = oFile.list();
	dump(var=aFiles);

	for (i=1; i <= arrayLen(aFiles); i++){
		writeOutput(aFiles[i]);
		if (createObject("java", "java.io.File").init(sBasePath & aFiles[i]).isDirectory()){
			writeOutput(" [DIR]<br />");
		}else{
			writeOutput(" [FILE]<br />");
		}
	}
</cfscript>