// TestOff.cfc
// TestOn.cfc
component extends="TestBase" {

	public void function testOffRemovesHandler() {
		structDelete(variables, "testOffRemovesHandlerResponse"); // ensure it doesn't exist

		variables.eventObject.on("TestEvent", function(){
			variables.testOffRemovesHandlerResponse = "TestEventHandlerResponse";
		});

		variables.eventObject.off("TestEvent");

		variables.eventObject.trigger("TestEvent");

		assertFalse(
			structKeyExists(variables, "testOffRemovesHandlerResponse"),
			"testOffRemovesHandlerResponse should not have been created"
		);
	}

	public void function testOffDoesNotFailWithUnknownEvent() {
		variables.eventObject.off("EventWithNoHandlers");
		// the test is that it doesn't error
	}

	public void function testOffRemovesMulipleHandlers() {
		structDelete(variables, "testOffRemovesMulipleHandlersResponse1"); // ensure it doesn't exist
		structDelete(variables, "testOffRemovesMulipleHandlersResponse2"); // ensure it doesn't exist

		variables.eventObject.on("TestEvent", function(){
			variables.testOffRemovesHandlerResponse1 = "TestEventHandlerResponse1";
		});
		variables.eventObject.on("TestEvent", function(){
			variables.testOffRemovesHandlerResponse2 = "TestEventHandlerResponse2";
		});

		variables.eventObject.off("TestEvent");

		variables.eventObject.trigger("TestEvent");

		assertFalse(
			structKeyExists(variables, "testOffRemovesMulipleHandlersResponse1"),
			"testOffRemovesMulipleHandlersResponse1 should not have been created"
		);

		assertFalse(
			structKeyExists(variables, "testOffRemovesMulipleHandlersResponse2"),
			"testOffRemovesMulipleHandlersResponse2 should not have been created"
		);
	}
	
	public void function testOffRemovesCorrectHandlers() {
		structDelete(variables, "testOffRemovesCorrectHandlersResponse1"); // ensure it doesn't exist
		structDelete(variables, "testOffRemovesCorrectHandlersResponse2"); // ensure it doesn't exist

		variables.eventObject.on("TestEvent1", function(){
			variables.testOffRemovesCorrectHandlersResponse1 = "TestEventHandlerResponse1";
		});
		variables.eventObject.on("TestEvent2", function(){
			variables.testOffRemovesCorrectHandlersResponse2 = "TestEventHandlerResponse2";
		});

		variables.eventObject.off("TestEvent1");

		variables.eventObject.trigger("TestEvent1");
		variables.eventObject.trigger("TestEvent2");

		assertFalse(
			structKeyExists(variables, "testOffRemovesMulipleHandlersResponse1"),
			"testOffRemovesMulipleHandlersResponse1 should not have been created"
		);

		assertTrue(
			structKeyExists(variables, "testOffRemovesCorrectHandlersResponse2"),
			"testOffRemovesCorrectHandlersResponse2 should not have been created"
		);
	}

}