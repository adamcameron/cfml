// EndPoint.cfc
component extends="Intermediary" {

	mixinLib = createObject("MixinLib");
	variables.mixinMethod = mixinLib.mixinMethod;
	variables.superProxy = super;

	remote string function remoteMethod(){	
		var result = privateMethod();
		return result;
	}

	private string function privateMethod(){
		var result = mixinMethod();
		return result;
	}

}