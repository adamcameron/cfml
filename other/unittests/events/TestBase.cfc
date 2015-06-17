// TestBase.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		addAssertDecorator("CustomAssertions");
		include "./function.cfm";
	}

	public void function setup(){
		variables.eventObject = createEventObject();
	}

}