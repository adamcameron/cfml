// TransactionLog.cfc
component implements="Logger" {

	public TransactionLog function init(required string logFile){
		structAppend(variables, arguments);
		return this;
	}

	public void function logEntry(required string text, string severity="information"){
		writeLog(log=logFile, text=text, type=severity);
	}
	
}