component {

	properties = {};

	function init(){
		properties.append(arguments);
		return this;
	}

	function newSelf(){
		return new "#getMetadata(this).fullName#"( argumentCollection = arguments );
		//return this.init(argumentCollection=arguments);
	}
	
	function getProperties(){
		return properties;
	}

}