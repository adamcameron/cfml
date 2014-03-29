// if.cfc
component output=true {

	variables.children = [];

	public boolean function onStartTag(required struct attributes, required struct caller){
		if (!structKeyExists(arguments.attributes, "condition")){
			throw(type="MissingAttributeException", message="The CONDITION attribute is required");
		}
		variables.result = evaluate(arguments.attributes.condition);
		return true;
	}

	public boolean function onEndTag(){
		return false;
	}

	public boolean function getResult(){
		writeOutput("getResult() called<br>");
		return variables.result;
	}

}