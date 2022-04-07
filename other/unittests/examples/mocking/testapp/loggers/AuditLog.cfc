// AuditLog.cfc
component implements="Logger" {

	public AuditLog function init(required string logFile, required testapp.security.Encrypter encrypter){
		structAppend(variables, arguments);
		return this;
	}

	public void function logEntry(required string text, string severity="warning"){
		writeLog(log=logFile, text=text, type=severity);
	}

}