// Tests.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		include "function.cfm";
		include "callbacksForTests.cfm";
	}

	public void function testBaseline(){
		var result = replaceWithCallback("match 1 match 2", "(match) ([1-3])", basicCallback, "ONE", true);
	}

	public void function testArgsPassedToCallback(){
		var result = replaceWithCallback("match 1 match 2", "match [1-3]", testArgsCallback, "ONE", true);
	}

	public void function testValueReturnedFromCallback(){
		var result = replaceWithCallback("match 1 match 2", "match [1-3]", testReturnValueCallback, "ONE", true);
		assertEquals("RETURNED FROM CALLBACK match 2", result);
	}

}