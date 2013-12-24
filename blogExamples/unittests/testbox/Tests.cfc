// Tests.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		variables.beforeTestsRun = true;
	}

	public void function setup(){
		variables.setupRun = true;
	}

	public void function testInitFunctions(){
		assert(structKeyExists(variables, "beforeTestsRun"));
		assert(structKeyExists(variables, "setupRun"));
	}

	public void function testThatErrors(){
		throw(type="TestException", message="This is a test exception", detail="Note that it is NOT being caught / tested for. This is by design");
	}

	public void function testThatFails(){
		fail("This test should fail");
	}

}