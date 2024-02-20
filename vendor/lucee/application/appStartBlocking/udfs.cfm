<cfscript>
private void function setSettings() {
	this.name = "app11"
}

private void function loadDataSources() {
	this.datasources["dsn1"] = {
		type = "mysql",
		host = "database.backend",
		port = 3306,
		database = server.system.environment.MARIADB_DATABASE,
		username = server.system.environment.MARIADB_USER,
		password = server.system.environment.MARIADB_PASSWORD,
		custom = {
			useUnicode = true,
			characterEncoding = "UTF-8",
			noAccessToProcedureBodies = true
		}
	}

	this.datasource = "dsn1"
}

private void function loadMappings() {
}

private function writeToLog(required string message) {
	var logFilePath = getTempDirectory() & "app1.log"

	param name="URL.requestId" default="1";

	var logLine = "#now()# (#URL.requestId#) #message# #chr(10)#"
	fileAppend(logFilePath, logLine)
}

private void function executeSlowDbOperation() {
	queryExecute("CALL sleep_and_return(3)")
}
</cfscript>
