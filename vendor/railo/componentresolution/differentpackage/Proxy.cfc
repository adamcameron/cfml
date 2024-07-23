// Proxy.cfc
component {

	public Proxy function init(required string componentName){
		variables.componentName = arguments.componentName;
		return this;
	}

	public any function getProxiedObject(){
		return createObject(variables.componentName);
	}

}