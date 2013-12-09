// TestdayOfWeekAsInteger.cfc
component extends="mxunit.framework.TestCase" {

	public void function beforeTests(){
		include "dayOfWeekAsInt.cfm";

		variables.daysOfWeek = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"];
	}

	public void function baseline(){
		for (var i=1; i <= arrayLen(daysOfWeek); i++){
			assertEquals(i, dayOfWeekAsInteger(daysOfWeek[i]), "Unexpected value returned for #daysOfWeek[i]#");
		}
	}
	
	public void function badInput(){
		expectException("ArgumentOutOfRangeException");
		dayOfWeekAsInteger("BAD_VALUE");
	}
	
	public void function badPadding(){
		expectException("ArgumentOutOfRangeException");
		dayOfWeekAsInteger(" Sunday ");
	}
	
	public void function usingNamedArg(){
		dayOfWeekAsInteger(day="Monday");
	}

}