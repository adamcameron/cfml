// WireboxBinder.cfc
component extends="wirebox.system.ioc.config.Binder" {

	function configure() {
		map("TransactionLog")
			.to("theapp.loggers.TransactionLog").asSingleton().noAutowire()
				.initArg(name="logFile", value="theappTransactionLog")

		map("MockedUserDAO")
			.to("theapp.users.MockedUserDAO").asSingleton().noAutowire()
				.initArg(name="transactionLog", ref="TransactionLog")

		map("StubEncrypter")
			.to("theapp.security.StubEncrypter").asSingleton().noAutowire()

		map("AuditLog")
			.to("theapp.loggers.AuditLog").asSingleton().noAutowire()
				.initArg(name="logFile", value="theappAuditLog")
				.initArg(name="encrypter", ref="StubEncrypter")
		
		map("UserService")
			.to("theapp.users.UserService").asSingleton().noAutowire()
				.initArg(name="userDAO", ref="MockedUserDAO")
				.initArg(name="auditLog", ref="AuditLog")
	}

}