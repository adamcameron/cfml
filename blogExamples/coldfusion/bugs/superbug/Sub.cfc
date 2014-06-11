// Sub.cfc
component extends="base" {

	mixinLib = createObject("MixinLib");
	variables.mixinMethod = mixinLib.mixinMethod;

	public string function callPrivateMethodViaMixin(){	
		return mixinMethod();
	}

	public string function callPrivateMethodDirectly(){	
		return basePrivateMethod();
	}

}