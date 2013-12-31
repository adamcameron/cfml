// Test.cfc
component {

	public any function takesTestObject(required Test obj){
		return obj;
	}

	public Test function returnsTestObject(required any obj){
		return obj;
	}

}