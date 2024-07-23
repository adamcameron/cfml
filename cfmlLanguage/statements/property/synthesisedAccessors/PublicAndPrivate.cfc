//PublicAndPrivate.cfc
component accessors=true {


	property propertyWithPrivateSetter;
	property propertyWithExplicitSetter;

	
	public PublicAndPrivate function init(required string propertyWithPrivateSetter){
		setpropertyWithPrivateSetter(propertyWithPrivateSetter);
		return this;
	}

	private void function setPropertyWithPrivateSetter(required string propertyWithPrivateSetter){
		variables.propertyWithPrivateSetter = "set via private method: " & arguments.propertyWithPrivateSetter;
	}

	public void function exposePrivateMethod(required string propertyWithPrivateSetter){
		setpropertyWithPrivateSetter(propertyWithPrivateSetter);
	}


	public void function setPropertyWithExplicitSetter(required string propertyWithExplicitSetter){
		variables.propertyWithExplicitSetter = "set via explicit setter: " & arguments.propertyWithExplicitSetter;
	}

}