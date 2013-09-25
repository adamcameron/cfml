<cfscript>
	if (thistag.executionMode == "END"){
		structAppend(variables, caller);

		thisDir = getDirectoryFromPath(getCurrentTemplatePath());
		fileName = createUuid();
		filePath = thisDir & fileName;
		try {
			fileWrite(filePath, "<cfoutput>" & thistag.generatedContent & "</cfoutput>");
			savecontent variable="content"{
				include fileName;
			}
			writeOutput(attributes.callback(content));
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