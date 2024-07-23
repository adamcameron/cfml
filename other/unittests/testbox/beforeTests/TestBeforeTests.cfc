// TestBeforeTests.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		//throw(type="TestException", message="An erroring in beforeTests() just errors out");
	}

}