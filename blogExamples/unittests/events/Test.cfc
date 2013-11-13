// Test.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		addAssertDecorator("CustomAssertions");
		include "./function.cfm";
	}

	public void function baseline(){
		createEventObject();
	}

	public void function testReturnValues(){
		var eventObject = createEventObject();
		
		assertIsStruct(eventObject, "Returned value should be a struct");
		assertStructKeysCorrect(
			"on,trigger",
			eventObject,
			"Incorrect keys returned in eventObject"
		);
		assertTrue(
			isClosure(eventObject.on),
			"The returned on() value should be a function"
		);

	}

}