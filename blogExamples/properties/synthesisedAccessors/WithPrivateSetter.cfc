// WithPrivateSetter.cfc
component accessors=true {

	property myProperty;

	function init(myProperty){
		setMyProperty(myProperty);
		return this;
	}

	private void function setMyProperty(myProperty){
		variables.myProperty = "set via explicit private setter: " & arguments.myProperty;
	}

}