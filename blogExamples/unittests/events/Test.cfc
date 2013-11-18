// Test.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		addAssertDecorator("CustomAssertions");
		include "./function.cfm";
	}

	public void function testBaseline(){
		createEventObject();
		// it doesn't error. That's it
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
		assertTrue(
			isClosure(eventObject.trigger),
			"The returned trigger() value should be a function"
		);

	}

	public void function testOnRequiresEventArg() {
		var failMsg = "on() should require an EVENT argument";
		var eventObject = createEventObject();
		try {
			eventObject.on(handler=function(){});
			fail(failMsg);
		} catch (any e){
			// can't catch this coherently as CF and Railo return completely different exceptions here
			assertTrue(
				findNoCase("event", e.message) && findNoCase("parameter", e.message),
				failMsg
			);
		}
	}

	public void function testOnRequiresHandlerArg()  {
		var failMsg = "on() should require an HANDLER argument";
		var eventObject = createEventObject();
		try {
			eventObject.on(event="TestEvent");
			fail(failMsg);
		} catch (any e){
			assertTrue(
				findNoCase("handler", e.message) && findNoCase("parameter", e.message),
				failMsg
			);
		}
	}

	public void function testTriggerRequiresEventArg()  {
		var failMsg = "trigger() should require an EVENT argument";
		try {
			eventObject.trigger();
			fail(failMsg);
		} catch (any e){
			assertTrue(
				findNoCase("event", e.message) && findNoCase("parameter", e.message),
				failMsg
			);
		}
	}

}