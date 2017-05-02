component {

	properties = {};

	function init(){
		properties.append(arguments);
		return this;
	}

	function newSelf(){
		return createObject(getMetadata(this).fullName).init(argumentCollection=arguments);
	}
	
	function getProperties(){
		return properties;
	}

}