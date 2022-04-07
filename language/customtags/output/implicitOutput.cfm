<cfscript>
// implicitOutput.cfm
if (thistag.executionMode == "START"){
	param string attributes.returnVariable="implicitOutput";
}else{
	structAppend(variables, caller);	// emulate the context of the calling code as best we can

	thisDir = getDirectoryFromPath(getCurrentTemplatePath());
	fileName = createUuid();
	filePath = thisDir & fileName;
	try {
		fileWrite(filePath, "<cfoutput>" & thistag.generatedContent & "</cfoutput>");
		savecontent variable="content"{
			include fileName;
		}
		caller[attributes.returnVariable] = content;
	}
	catch (any e){
		rethrow;
	}
	finally {
		if (fileExists(filePath)){
			try {
				fileDelete(filePath);
			} catch(any ignore){
				// oh well: I tried
			}
		}
	}
	thistag.generatedcontent = "";
}
</cfscript>