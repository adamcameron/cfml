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

	public void function testTriggerPassesEventObjToHandler() {
		variables.eventObject.on("TestEvent", function(){
			if (!structKeyExists(arguments, "event")){
				throw(type="MissingArgumentException", message="Event object not passed to handler");
			}
		});
		try {
			variables.eventObject.trigger("TestEvent");
		}
		catch (MissingArgumentException e){
			fail(e.message);
		}
	}

	public void function testTriggerPassesEventInEventObjToHandler() {
		variables.eventObject.on("TestEvent", handlerForTestTriggerPassesEventInEventObjToHandler);
		try {
			variables.eventObject.trigger("TestEvent");
		}
		catch (MissingEventException e){
			fail(e.message);
		}
	}

	public void function testTriggerPassesDefaultDataInEventObjToHandler() {
		variables.eventObject.on("TestEvent", function(){
			if (!structKeyExists(arguments.event, "data")){
				throw(type="MissingDataException", message="Data not passed to handler");
			}
		});
		try {
			variables.eventObject.trigger("TestEvent");
		}
		catch (MissingDatatException e){
			fail(e.message);
		}
	}

	public void function testTriggerPassesSpecificDataInEventObjToHandler() {
		var testData = {key="value"};
		variables.eventObject.on(
			"TestEvent",
			function(){
				if (!structKeyExists(arguments.event, "data")){
					throw(type="MissingDataException", message="Data not passed to handler");
				}
				if (!structKeyExists(arguments.event.data, "key")){
					throw(type="InvalidDataException", message="key not found in data");
				}
				if (arguments.event.data.key != "value"){
					throw(type="InvalidDataException", message="key has incorrect value");
				}
			},
			testData
		);
		try {
			variables.eventObject.trigger("TestEvent");
		}
		catch (MissingArgumentException e){
			fail(e.message);
		}
	}

	public void function testTriggerDefaultsAdditionalParameters() {
		variables.eventObject.on(
			"TestEvent",
			function(){
				if (structKeyList(arguments) != "event"){
					throw(type="UnexpectedArgumentsException", message="trigger() passed unexpected arguments");
				}
			}
		);
		try {
			variables.eventObject.trigger("TestEvent");
		}
		catch (UnexpectedArgumentsException e){
			fail(e.message);
		}
	}

	public void function testTriggerPassesAdditionalParameters() {
		var additionalParams ={
			triggerParam1 = "triggerParam1Value",
			triggerParam2 = "triggerParam2Value"
		};
		variables.eventObject.on(
			"TestEvent",
			function(){
				var argNames = structKeyList(arguments);
				if (listSort(argNames, "textNoCase") != "event,triggerParam1,triggerParam2"){
					throw(type="UnexpectedArgumentsException", message="trigger() passed unexpected arguments: #argNames#");
				}
			}
		);
		try {
			variables.eventObject.trigger("TestEvent", additionalParams);
		}
		catch (UnexpectedArgumentsException e){
			fail(e.message);
		}
	}

	private void function handlerForTestTriggerPassesEventInEventObjToHandler(required struct event){
		if (!structKeyExists(arguments.event, "event")){
			throw(type="MissingEventException", message="Event name not passed to handler");
		}
		if (arguments.event.event != "TestEvent"){
			throw(type="InvalidEventException", message="Event object did not contain correct event name");
		}
	}

}