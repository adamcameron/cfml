// C.cfc
component {

	variables.myProperty = "";

	public void function setMyProperty(required string myProperty){
		variables.myProperty = arguments.myProperty;
	}

	public string function getMyProperty(){
		return variables.myProperty;
	}
	
}