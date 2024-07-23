// TestC.cfc
component extends="mxunit.framework.TestCase" {
	
	public void function setup(){
		variables.oTestC = new C();
		variables.oTestC.getVariables = getVariables;
	}

	public void function testSetMyProperty(){
		var valueToSet = "TEST_setMyProperty";
		variables.oTestC.setMyProperty(valueToSet);

		var valueActuallySet = variables.oTestC.getVariables().myProperty;

		assertEquals(
			valueToSet,
			valueActuallySet,
			"setMyProperty() set myProperty incorrectly"
		);
	}

	private struct function getVariables(){
		return variables;
	}

}