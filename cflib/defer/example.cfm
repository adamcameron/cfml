<cfscript>
bigFileToProcess = "path/to/file";

deferredJob = defer(
	job		= function(){
		var someResult = "";
		var fileHandle = fileOpen(bigFileToProcess, "read");
		while (!fileIsEof(fileHandle)){
			var line = fileReadLine(fileHandle);
			// etc
		}
		fileClose(fileHandle); 
		return someResult;
	},
	onSuccess	= function(result){
		// will receive someResult, so do something with it
	},
	onFailure	= function(e){
		writeLog(file="someLogFIle", text="It didnae work because of #e.message#");
	}
);
</cfscript>

