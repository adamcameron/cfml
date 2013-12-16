// Test.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		addAssertDecorator("unittests.CustomAssertions");
		include "./function.cfm";
	}

	public void function setup(){
		variables.DI = createDependencyInjector();
	}

	public void function baseline(){
		createDependencyInjector();
		// not erroring is sufficient
	}

	public void function returnValues(){
		assertStructKeysCorrect("createObjectViaDI", variables.DI, "Incorrect keys returned");
		assert(isClosure(variables.DI.createObjectViaDI), "createObjectViaDI should be a function");
	}

	public void function createObjectViaDIDefinition(){
		var md = getMetadata(variables.DI.createObjectViaDI);
		assertEquals("componentpath", md.parameters[1].name, "createObjectViaDI() arguments incorrect");
		assert(md.parameters[1].required, "createObjectViaDI() componentpath argument should be required");
		assertEquals("string", md.parameters[1].type, "createObjectViaDI() componentpath argument should require a string");
	}

}