// Sub.cfc
component extends="base" {

	mixinLib = createObject("MixinLib");
	variables.mixinMethod = mixinLib.mixinMethod;
	//variables.superProxy = super;

	public string function callPrivateMethodViaMixin(){	
		return mixinMethod();
	}

	public string function callPrivateMethodDirectly(){	
		return basePrivateMethod();
	}

}