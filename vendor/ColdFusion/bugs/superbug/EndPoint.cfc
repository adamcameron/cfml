// EndPoint.cfc
component extends="Intermediary" {

	mixinLib = createObject("MixinLib");
	variables.mixinMethod = mixinLib.mixinMethod;

	remote string function remoteMethod(){	
		return privateMethod();
	}

	private string function privateMethod(){
		return mixinMethod();
	}

}