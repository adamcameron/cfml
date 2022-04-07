// MockedUserDAO.cfc
component implements="IUserDAO" {

	records = queryNew(
		"id,firstName,lastName,loginId,password",
		"integer,varchar,varchar,varchar,varchar",
		[
			[1, "Zinzan", "Brooke", "number", "eight"],
			[2, "Daniel", "Vettori", "leftarm", "spin"]
		]
	)

	public MockedUserDAO function init(required Logger transactionLog){
		structAppend(variables, arguments)
		return this
	}

	public query function getUserById(required numeric id){
		transactionLog.logEntry("getUserById(#id#) called")
		return queryExecute("SELECT * FROM records WHERE id = :id", {id=id}, {dbtype="query", records=records})
	}

	public query function getUserByLogin(required string loginId, required string password){
		transactionLog.logEntry("getUserByLogin('#loginId#', 'REDACTED') called")
		return queryExecute("SELECT * FROM records WHERE loginId = :loginId AND password = :password", {loginId=loginId,password=password}, {dbtype="query", records=records})
	}

}