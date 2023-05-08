// Application.cfc
component {

	param URL.dsnId = 1;
	param URL.appId = 1;
	param URL.logId = 1;

	variables.dsnHandler = variables[structKeyExists(server, "railo") ? "getDsnDetailsRailo":"getDsnDetailsCF"];

	request.startTicks = getTickCount();
	logIt("Pseudo-constructor start of request");

	this.name = "needsAppRestart_#URL.appId#";

	logIt("Pseudo-constructor before datasources set");
	this.datasources = {
		dsn	= variables.dsnHandler(URL.dsnId)
	};
	this.datasource	= "dsn";
	logIt("Pseudo-constructor after datasources set");
	logIt("========================================");



	function getDsnDetailsCF(id){
		logIt("#getFunctionCalledName()#() called");
		return {
			database	= "db_dsn#id#",
			host		= "localhost",
			port		= "3306",
			driver		= "MySQL5",
			username	= "user_dsn#id#",
			password	= "user_dsn#id#"
		};
	}

	function getDsnDetailsRailo(id){
		logIt("#getFunctionCalledName()#() called");
		return {
			class			= "org.gjt.mm.mysql.Driver",
			connectionString= "jdbc:mysql://localhost:3306/db_dsn#id#?useUnicode=true&characterEncoding=UTF-8&useLegacyDatetimeCode=true",
			username		= "user_dsn#id#",
			password		= "user_dsn#id#"
		};
	}

	function logIt(message){
		var requestDuration = getTickCount() - request.startTicks;
		writeLog(file="needsAppRestart_#URL.logId#", text="(#URL.appId#) #requestDuration#ms #message# (#URL.dsnId#)");
	}

}