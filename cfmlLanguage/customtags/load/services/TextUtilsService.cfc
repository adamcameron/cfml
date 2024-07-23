// TextUtilsService.cfc
component {

	variables.fillerText = [];

	public TextUtilsService function init(){
		var thisDir = getDirectoryFromPath(getCurrentTemplatePath());
		var fillerTextFilePath = thisDir & "filler.txt";

		try {
			var fillerTextFile = fileOpen(fillerTextFilePath, "read");
			while (!fileIsEof(fillerTextFile)){
				arrayAppend(variables.fillerText, fileReadLine(fillerTextFile));
			}
		}
		catch (any e){
			rethrow;
		}
		finally{
			try {
				fileClose(fillerTextFile);
			} catch (any ignore){
				// NOP
			}
		}
		this.fillerText = variables.fillerText;
		return this;
	}

	string function getFiller(required numeric paragraphs){
		savecontent variable="local.filler" {
			for (var i=1; i <= paragraphs; i++){
				writeOutput("<p>#variables.fillerText[i]#</p>");
			}
		}
		return local.filler;
	}

	string function getSpacer(required numeric lines){
		return repeatString("<br>", lines);
	}

}