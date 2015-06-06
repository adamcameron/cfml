component {

	public void function testMethod(){
		var result = false;
		
		writeLog(file="structShorthandNotation", text="test(): before call to method1()");
		result = getOther("dummy").method1(settings={setting1=getHelper("dummy1").getArgValue("theValue1")});
		
		writeLog(file="structShorthandNotation", text="test(): after call to method1()");

		writeLog(file="structShorthandNotation", text="test(): before call to method2()");
		result = getOther("dummy").method2(settings={setting2=getHelper("dummy2").getArgValue("theValue2")});
		writeLog(file="structShorthandNotation", text="test(): after call to method2()");
	}
	
	private Other function getOther(required string dummy){
		return new Other();
	}
	
	private Helper function getHelper(required string dummy){
		return new Helper();
	}

}