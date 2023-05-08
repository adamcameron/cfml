// True.cfc
component {
writeDump(var=this);
	variables.exitCondition = false;

	public void function init(required component parent){
		variables.parent = parent;

	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		if (variables.parent.getResult() == variables.exitCondition){
			return false;
		}
		return true;
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		writeOutput(generatedContent);
		return false;
	}

}
