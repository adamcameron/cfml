<cfscript>
	dataFile = fileOpen(expandPath("./text.dat"), "append");
	i = 0;
	while (i < 1024*1024){
		fileWrite(dataFile, chr(randRange(97, 122)));
		i++;
		if (randRange(1,8) == 1){
			fileWrite(dataFile, " ");
			i++;
		}
	}
	fileClose(dataFile);
</cfscript>