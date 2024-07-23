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

}

<cfscript>
     // function.cfm
     function createEventObject(){};

assertIsTypeOf(
	eventObject.on,
	"OnDelegate",
	"The returned on() function needs to be a delegate of type OnDelegate"
);

     delegate void OnDelegate(required string event, required function handler, optional struct data);

</cfscript>


// CustomAssertions.cfc
component {

	public void function assertStructKeysCorrect(required string keys, required struct struct, string message){
		var assertionArgs = {
			expected = listSort(keys, "textnocase"),
			actual	 = listSort(structKeyList(struct), "textnocase")
		};
		if (structKeyExists(arguments, "message")){
			assertionArgs.message = message;
		}
		assertEquals(argumentCollection=assertionArgs);
	}

}

<cfscript>
public void function testRequiredArgumentMissingException() {
	expectException("RequiredArgumentMissingException");
	throw(type="RequiredArgumentMissingException");
}
</cfscript>