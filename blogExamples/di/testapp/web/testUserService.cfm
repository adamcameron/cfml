<cfscript>
// testUserService.cfm
userService = new testapp.users.UserService(
	userDAO = new testapp.users.MockedUserDAO(
		transactionLog = new testapp.loggers.TransactionLog(logFile="transactionLog")
	),
	auditLog = new testapp.loggers.AuditLog(
		logFile		= "transactionLog",
		encrypter	= new testapp.security.StubEncrypter()
	) 
);
	
zinny = userService.getUserById(1);
writeDump(var=[userService, zinny]);
</cfscript>