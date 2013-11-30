// TestTrigger.cfc
component extends="TestBase" {

	// currently trigger() tests are actuaqlly performed as part of the on() tests.

	public void function beforeTests(){
		super.beforeTests();
		testOn = new TestOn();
		testOn.beforeTests();
	}

	public void function setup(){
		super.setup();
		testOn.setup();
	}

	// TODO: find a way to decouple these tests

	public void function testTriggerCalledStoredHandler() {
		testOn.testOnStoresHandler();
	}

	public void function testTriggerCalledMultipleStoredEvents() {
		testOn.testOnStoresMultipleEvents();
	}

	public void function testTriggerNonExistentEvent() {
		variables.eventObject.trigger("EventWithNoHandlers");
		// the test is that it doesn't error
	}

	public void function testTriggerCalledMultipleStoredHandlers() {
		testOn.testOnStoresMultipleHandlers();
	}

/*

	public void function testTriggerPassesEventObjToHandler() {
		variables.eventObject.on("TestTriggerPassesEventObjToHandlerRun", function(){
			if (!structKeyExists(arguments, "event")){
				throw(type="MissingArgumentException", message="Event object not passed to handler");
			}
		});
		try {
			variables.eventObject.trigger("TestTriggerPassesEventObjToHandlerRun");
		}
		catch (MissingArgumentException e){
			fail(e.message);
		}
	}

	public void function testTriggerPassesEventInEventObjToHandler() {
		variables.eventObject.on("TestTriggerPassesEventInEventObjToHandlerRun", function(){
			if (!structKeyExists(arguments.event, "event")){
				throw(type="MissingArgumentException", message="Event object not passed to handler");
			}
			if (arguments.event.event != "TestTriggerPassesEventInEventObjToHandlerRun"){
				throw(type="InvalidEventException", message="Event object did not contain correct event name");
			}
		});
		try {
			variables.eventObject.trigger("TestTriggerPassesEventInEventObjToHandlerRun");
		}
		catch (MissingArgumentException e){
			fail(e.message);
		}
	}
*/
}