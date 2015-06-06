component {

	this.name = "henry16";

	void function onRequestStart(){
		writeLog(file=this.name, text="onRequestStart() called");
		writeLog(file=this.name, text=serializeJson(CGI));
	}
	
	public void function onRequest(){
		writeLog(file=this.name, text="onRequest() called");
		include arguments[1];
	}


	public any function onCfcRequest(required string cfc, required string method, required struct args){
		writeLog(file=this.name, text="onCfcRequest() called");
		writeLog(file=this.name, text=serializeJson(arguments));
		var o = createObject(arguments.cfc);
		var metadata = getMetadata(o[method]); 
		
//		if (structKeyExists(metadata, "access") && metadata.access == "remote"){
			return invoke(o, method, args);
//		}else{
//			throw(type="InvalidMethodException", message="Invalid method called", detail="The method #method# does not exists or is inaccessible remotely");
//		}
	}

}