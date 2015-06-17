//TestSetup.cfc
component extends="mxunit.framework.TestCase" {

	public void function setup(){
		throw(type="TesTException", message="An erroring in setup() is handled gracefully");
	}


	public void function testSetup(){
	}

}