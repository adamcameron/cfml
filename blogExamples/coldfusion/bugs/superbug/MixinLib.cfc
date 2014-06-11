// MixinLib.cfc
component {
	
	public string function mixinMethod(){
		var result = super.basePrivateMethod();
		return result;
	}

}