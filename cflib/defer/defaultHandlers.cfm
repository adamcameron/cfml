<cfscript>
	job = function(){
		writeLog(file=logName, text="job() called @ #ts()#");
	};
	onSuccess = function(){
		writeLog(file=logName, text="onSuccess called() with #serializeJson(arguments)# @ #ts()#");
	};
	onFailure = function(){
		writeLog(file=logName, text="onFailure called() with #serializeJson(arguments)# @ #ts()#");
	};
	onError = function(){
		writeLog(file=logName, text="onError called() with #serializeJson(arguments)# @ #ts()#");
	};
	onTerminate = function(){
		writeLog(file=logName, text="onTerminate called() with #serializeJson(arguments)# @ #ts()#");
	};
</cfscript>