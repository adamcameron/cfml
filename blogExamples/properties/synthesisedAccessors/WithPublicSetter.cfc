// WithPublicSetter.cfc
component accessors=true {

	property myProperty;

	function init(myProperty){
		setMyProperty(myProperty);
		return this;
	}

	public void function setMyProperty(myProperty){
		variables.myProperty = "set via explicit public setter: " & arguments.myProperty;
	}

}