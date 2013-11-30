// TestOn.cfc
component extends="TestBase" {

	public void function testOnStoresHandler() {
		structDelete(variables, "testOnStoresHandlerResponse"); // ensure it doesn't exist
		var handlerResponse = createUuid();

		variables.eventObject.on("TestOnStoresHandlerRun", function(){
			variables.testOnStoresHandlerResponse = handlerResponse;
		});

		variables.eventObject.trigger("TestOnStoresHandlerRun");
		assertTrue(
			structKeyExists(variables, "testOnStoresHandlerResponse"),
			"testOnStoresHandlerResponse should have been created"
		);
		assertEquals(
			handlerResponse,
			variables.testOnStoresHandlerResponse,
			"testOnStoresHandlerResponse set incorrectly"
		);
	}

	public void function testOnStoresMultipleEvents() {
		structDelete(variables, "testOnStoresMultipleEvents1"); // ensure it doesn't exist
		structDelete(variables, "testOnStoresMultipleEvents2"); // ensure it doesn't exist
		var handlerResponse1 = createUuid();
		var handlerResponse2 = createUuid();

		variables.eventObject.on("TestOnStoresMultipleEventsEvent1Run", function(){
			variables.testOnStoresMultipleEvents1 = handlerResponse1;
		});
		variables.eventObject.on("TestOnStoresMultipleEventsEvent2Run", function(){
			variables.testOnStoresMultipleEvents2 = handlerResponse2;
		});

		variables.eventObject.trigger("TestOnStoresMultipleEventsEvent1Run");
		assertTrue(
			structKeyExists(variables, "testOnStoresMultipleEvents1"),
			"testOnStoresMultipleEvents1 should have been created"
		);
		assertEquals(
			handlerResponse1,
			variables.testOnStoresMultipleEvents1,
			"testOnStoresMultipleEvents1 set incorrectly"
		);

		variables.eventObject.trigger("TestOnStoresMultipleEventsEvent2Run");
		assertTrue(
			structKeyExists(variables, "testOnStoresMultipleEvents2"),
			"testOnStoresMultipleEvents2 should have been created"
		);
		assertEquals(
			handlerResponse2,
			variables.testOnStoresMultipleEvents2,
			"testOnStoresMultipleEvents2 set incorrectly"
		);
	}

	public void function testOnStoresMultipleHandlers() {
		structDelete(variables, "TestOnStoresMultipleHandlers1"); // ensure it doesn't exist
		structDelete(variables, "TestOnStoresMultipleHandlers2"); // ensure it doesn't exist
		var handlerResponse1 = createUuid();
		var handlerResponse2 = createUuid();

		variables.eventObject.on("TestOnStoresMultipleHandlers", function(){
			variables.testOnStoresMultipleHandlers1 = handlerResponse1;
		});
		variables.eventObject.on("TestOnStoresMultipleHandlers", function(){
			variables.testOnStoresMultipleHandlers2 = handlerResponse2;
		});

		variables.eventObject.trigger("TestOnStoresMultipleHandlers");
		assertTrue(
			structKeyExists(variables, "testOnStoresMultipleHandlers1"),
			"testOnStoresMultipleHandlers1 should have been created"
		);
		assertEquals(
			handlerResponse1,
			variables.testOnStoresMultipleHandlers1,
			"testOnStoresMultipleHandlers1 set incorrectly"
		);
		assertTrue(
			structKeyExists(variables, "testOnStoresMultipleHandlers2"),
			"testOnStoresMultipleHandlers2 should have been created"
		);
		assertEquals(
			handlerResponse2,
			variables.testOnStoresMultipleHandlers2,
			"testOnStoresMultipleHandlers2 set incorrectly"
		);
	}

}