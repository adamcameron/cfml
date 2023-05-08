component {

	remote void function remoteMethod(){
		var text = "";
		try {
			text = serializeJson(application);
		}
		catch(any e){
			text = serializeJson(e);
		}
		writeLog(file="TestWithCfc", text=text);
	}

}