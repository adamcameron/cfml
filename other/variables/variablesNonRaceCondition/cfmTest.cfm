<cfflush interval="16">
<cfscript>
	param name="URL.id" default="1";
	
	function foo(){
		variables.foo = now();
		msg("Top of foo(), variables.foo: [#variables.foo#]");
	
		//Do some other processing
		sleep(10000);
	
		msg("Bottom of foo(), variables.foo: [#variables.foo#]");
		return foo;
	}
	
	string function msg(required string message, string id=URL.id){
		var s = "[#timeFormat(now(), 'HH:MM:SS.LLL')#] [#id#] #message#";
		writeLog(file="variablesTestCfm2", text=s);
		writeOutput(s & "<br>");
	}
	
	msg("Begin request");
	msg("Before call to foo()");
	foo();
	msg("After call to foo(), variables.foo: [#variables.foo#]");
</cfscript>