// WithPrivateSetter.cfc
component accessors=true {

	property myProperty;

	function init(myProperty){
		setMyProperty(myProperty, "dummy");
		return this;
	}

	private void function setMyProperty(myProperty, required myOtherProperty){
		variables.myProperty = "set via explicit private setter: " & arguments.myProperty;
	}

	function dump(){
		for (var key in variables){
			writeDump(var=[variables[key]], label="variables[#key#]");
		}
		writeOutput("<hr>");
		for (key in this){
			writeDump(var=[this[key]], label="this[#key#]");
		}
	}

}