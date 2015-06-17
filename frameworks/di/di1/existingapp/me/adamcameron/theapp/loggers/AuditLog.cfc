// AuditLog.cfc
component implements="Logger" {

	public AuditLog function init(required string logFile, required Encrypter encrypter){
		structAppend(variables, arguments)
		return this
	}

	public void function logEntry(required string text, string severity="warning"){
		writeLog(file=logFile, text=encrypter.encrypt(text), type=severity)
	}

}