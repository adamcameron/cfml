// Child.cfc
component {

	public void function init(required component parent){
		variables.parent = parent
	}

	public boolean function onStartTag(required struct attributes, required struct caller){
		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		return false
	}

}
