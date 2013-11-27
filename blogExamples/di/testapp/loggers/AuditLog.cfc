// AuditLog.cfc
component implements="Logger" {

	public Logger function init(required string logFile, required Encrypter encrypter){
		structAppend(variables, arguments);
		return this;
	}

	public void function logEntry(required string text, string severity){
		writeLog();
	}
}