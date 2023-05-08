// CfcTest.cfc
component {

	public date function foo(){
		variables.foo = now();
		msg("Top of foo(), variables.foo: [#variables.foo#]");
	
		//Do some other processing
		sleep(10000);
	
		msg("Bottom of foo(), variables.foo: [#variables.foo#]");
		return foo;
	}
	
	public string function msg(required string message, string id){
		var s = "[#timeFormat(now(), 'HH:MM:SS.LLL')#] [#id#] #message#";
		writeLog(file="variablesTestCfc5", text=s);
		writeOutput(s & "<br>");
	}
	
	public date function getFoo(){
		return variables.foo;
	}

}