// Simple.cfc
component implements="Stringable" {

	public Simple function init(required array array){
		variables.array = arguments.array;
		return this;
	}
	
	public string function toString(){
		return arrayToList(variables.array);
	}
	
}