<cfscript>
// explicitOutput.cfm
if (thistag.executionMode == "START"){
	param string attributes.returnVariable="impliedOutput";
}else{
	structAppend(variables, caller);	// emulate the context of the calling code as best we can

	thisDir = getDirectoryFromPath(getCurrentTemplatePath());
	fileName = createUuid();
	filePath = thisDir & fileName;
	try {
		savecontent variable="content" {
			writeOutput(thisTag.generatedContent);
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
	thisTag.generatedContent = "";
}
</cfscript>