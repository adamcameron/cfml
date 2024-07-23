component {

	writeLog(file="simpleCustomTag", text="in Simple.pseudoconstructor");

	public boolean function onStartTag(){
		return true;
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		writeOutput('<span style="color:blue">#generatedContent#</span>');
		return false;
	}

}