// TestMethods.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		variables.expectedResult = "this is what we expect";
	}

	public void function setup(){
		variables.testObject = new ViaTags();
	}

	public void function testOutputSuppressedNoOutput(){
		assertEquals(expectedResult, testObject.outputSuppressedNoOutput());
	}

	public void function testOutputSuppressedExplicitOutput(){
		assertEquals(expectedResult, testObject.outputSuppressedExplicitOutput());
	}

	public void function testOutputUnspecifiedNoOutput(){
		assertEquals(expectedResult, testObject.outputUnspecifiedNoOutput());
	}

	public void function testOutputUnspecifiedExplicitOutput(){
		assertEquals(expectedResult, testObject.outputUnspecifiedExplicitOutput());
	}

	public void function testOutputTrueNoOutput(){
		assertEquals(expectedResult, testObject.outputTrueNoOutput());
	}

	public void function testOutputTrueExplicitOutput(){
		assertEquals(expectedResult, testObject.outputTrueExplicitOutput());
	}

}