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

	public query function getUserById(required numeric id){
		return queryService.setSql("SELECT * FROM records WHERE id = #id#").execute().getResult();
	}

	public query function getUserByLogin(required string loginId, required string password){
		return queryService.setSql("SELECT * FROM records WHERE loginId = '#loginId#' AND password = '#password#'").execute().getResult();
	}

}