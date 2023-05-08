// TestMxUnitCompat.cfc
component extends="mxunit.framework.TestCase" {

	function beforeTests(){
		variables.testInstance = new C();
		new testbox.system.testing.MockBox().prepareMock(testInstance);
		testInstance.$("getId").$callback(mockedGetId);
	}

	function testGetStructWithUniqueKeys(){
		var iterations	= 10;
		var result		= testInstance.getStructWithUniqueKeys(iterations=iterations);
		assertEquals(iterations, structCount(result), "Incorrect number of struct keys created, implying non-unique results were returned from mock");
	}

	private function mockedGetId(){
		return createUuid();
	}

}