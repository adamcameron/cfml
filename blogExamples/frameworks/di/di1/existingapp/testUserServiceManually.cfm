<cfscript>
// testUserServiceManually.cfm

userService = new theapp.users.UserService(
	userDAO		= new theapp.users.MockedUserDAO(
		transactionLog = new theapp.loggers.TransactionLog(logFile="theappTransactionLog")
	),
	auditLog	= new theapp.loggers.AuditLog(
		logFile		= "theappAuditLog",
		encrypter	= new theapp.security.StubEncrypter()
	)
)


user = userService.getUserById(1)
dump(user.getAsStruct())
</cfscript>
