//TestExpectedException.cfc
component extends="mxunit.framework.TestCase" {

	/**
	* @mxunit:expectedexception AnExpectedException
	*/ 
	public void function testExpectedExceptionPass(){
		throw(type="AnExpectedException", message="You should have expected that!");
	}

	/**
	* @mxunit:expectedexception AnExpectedException
	*/ 
	public void function testUnexpectedExceptionFail(){
		throw(type="AnUnexpectedException", message="You didn't expect that!");
	}

}