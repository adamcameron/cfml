//Application.cfc
component {

public void function onRequest(required string requestedFile){
	writelog(file="requests",text=arguments.requestedFile);
	if (arguments.requestedFile does not contain "restricted"){
		include arguments.requestedFile;
		writelog(file="requests", text="#arguments.requestedFile# Completed OK");
	}else{
		writelog(file="requests", text="#arguments.requestedFile# Blocked", type="warning");
		throw(type="InvalidFileException", errorCode=403);
	}
}

public any function onCfcRequest(required string cfc, required string method, required struct args){
	return invoke(cfc, method, args);
}
	
}

