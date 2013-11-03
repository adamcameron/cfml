component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){	
		include "./function.cfm";
	}

	public void function setup(){
	}

	public void function tearDown(){
	}

	public void function afterTests(){
	}

	public void function baseline(){
		createEventObject();
	}

	private void function testHelper(){
	}

}