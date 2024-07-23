<cfscript>
// promise.cfm

writeLog(file="p7", text="Beginning of calling code");

p = new Promise(function(resolve){
	writeLog(file="p7", text="Beginning of executor");

	thread name="t3" action="run" {
		writeLog(file="p7", text="Beginning of async operation");
		sleep(2000);
		resolve("executor done");
		writeLog(file="p7", text="End of async operation");
	}

	writeLog(file="p7", text="End of executor");
});	

writeLog(file="p7", text="Middle of calling code");

p.then(function(value){
	writeLog(file="p7", text="then() called with #value#");
});

sleep(5000);
writeLog(file="p7", text="End of calling code");
</cfscript>