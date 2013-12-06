<cfscript>
	logit(getCurrentTemplatePath());
	try {
		text = serializeJson(application);
	}
	catch(any e){
		text = serializeJson(e);
	}
	writeLog(file="TestWithCfm", text=text);

</cfscript>