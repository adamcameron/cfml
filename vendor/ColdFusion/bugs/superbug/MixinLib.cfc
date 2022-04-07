// MixinLib.cfc
component {
	
	public string function mixinMethod(){
		//return variables.superProxy.basePrivateMethod();
		return super.basePrivateMethod();
	}

}