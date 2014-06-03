<cfscript>
	if (thistag.hasEndtag){
		throw(type="IllegalEndTagException" message="Context validation error for the filler tag" detail="The filler tag must not have a matching end tag.");
	}
	param attributes.paragraphs=0;
	if (!attributes.paragraphs){
		exit;
	}
	thisDir = getDirectoryFromPath(getCurrentTemplatePath());
	fillerTextFilePath = thisDir & "filler.txt";

	fillerTextFile = fileOpen(fillerTextFilePath, "read");
	for (i=1; i <= attributes.paragraphs; i++){
		if (fileIsEof(fillerTextFile)){
			break;
		}
		writeOutput("<p>#fileReadLine(fillerTextFile)#</p>");
	}
	fileClose(fillerTextFile);
</cfscript>