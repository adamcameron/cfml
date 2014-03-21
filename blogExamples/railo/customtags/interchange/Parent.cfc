// Parent.cfc
component {

	variables.condition = true;

	param name="this.id" default=createGuid()

	public boolean function onStartTag(required struct attributes, required struct caller){
		return true
	}

	public boolean function onEndTag(required struct attributes, required struct caller, required string generatedContent){
		return false
	}

}