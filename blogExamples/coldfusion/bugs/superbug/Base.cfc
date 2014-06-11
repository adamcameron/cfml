// Base.cfc
component {

	public Base function init(){
		return this;
	}

	private string function basePrivateMethod(){
		return createUuid();
	}
	
}