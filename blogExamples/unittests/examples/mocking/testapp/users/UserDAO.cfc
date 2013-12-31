// UserDAO.cfc
component implements="IUserDAO" {

	queryService = new Query(datasource="testapp");

	public UserDAO function init(required testapp.loggers.Logger transactionLog){
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