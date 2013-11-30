// TestCreateEventObject.cfc
component extends="TestBase" {

	public void function testBaseline(){
		createEventObject();
		// it doesn't error. That's it
	}

	public void function testReturnValues(){
		
		assertIsStruct(variables.eventObject, "Returned value should be a struct");
		assertStructKeysCorrect(
			"on,trigger",
			variables.eventObject,
			"Incorrect keys returned in eventObject"
		);
		assertTrue(
			isClosure(variables.eventObject.on),
			"The returned on() value should be a function"
		);
		assertTrue(
			isClosure(variables.eventObject.trigger),
			"The returned trigger() value should be a function"
		);
	}

	public void function testOnRequiresEventArg() {
		var failMsg = "on() should require an EVENT argument";
		try {
			variables.eventObject.on(handler=function(){});
			fail(failMsg);
		} catch (any e){
			// can't catch this coherently by exception type as CF and Railo return completely different exceptions here
			assertTrue(
				findNoCase("event", e.message) && findNoCase("parameter", e.message),
				failMsg
			);
		}
	}

	public void function testOnRequiresHandlerArg()  {
		var failMsg = "on() should require an HANDLER argument";
		try {
			variables.eventObject.on(event="TestEvent");
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
			variables.eventObject.trigger();
			fail(failMsg);
		} catch (any e){
			assertTrue(
				findNoCase("event", e.message) && findNoCase("parameter", e.message),
				failMsg
			);
		}
	}

}