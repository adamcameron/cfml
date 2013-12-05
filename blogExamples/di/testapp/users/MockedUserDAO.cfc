// MockedUserDAO.cfc
component implements="IUserDAO" {

	records = queryNew(
		"id,firstName,lastName,loginId,password",
		"integer,varchar,varchar,varchar,varchar",
		[
			[1, "Zinzan", "Brooke", "number", "eight"],
			[2, "Daniel", "Vettori", "leftarm", "spin"]
		]
	);

	queryService = new Query(dbtype="query", records=records);

	public MockedUserDAO function init(required testapp.loggers.Logger transactionLog){
		structAppend(variables, arguments);
		return this;
	}

	public query function getUserById(required numeric id){
		transactionLog.logEntry("getUserById(#id#) called");
		return queryService.setSql("SELECT * FROM records WHERE id = #id#").execute().getResult();
	}

	public query function getUserByLogin(required string loginId, required string password){
		transactionLog.logEntry("getUserByLogin('#loginId#', 'REDACTED') called");
		return queryService.setSql("SELECT * FROM records WHERE loginId = '#loginId#' AND password = '#password#'").execute().getResult();
	}

}