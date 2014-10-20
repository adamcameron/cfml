// Application.cfc
component {
	this.name		= "di1_1"
	this.mappings	= {
		"/di1"		= expandPath("/shared/frameworks/di1"),
		"/theapp"	= expandPath("./me/adamcameron/theapp")
	}
	this.applicationTimeout = createTimespan(0,0,0,10)

	function onApplicationStart(){
		application.beanFactory = new di1.IOC(folders=expandPath("./me/adamcameron/theapp"))
		configureDi()
	}

	private function configureDi(){
		application.beanFactory.declareBean("userDAO", "theapp.users.MockedUserDAO")
		application.beanFactory.addBean("transactionLog", new theapp.loggers.TransactionLog(logFile="theappTransactionLog"))

		application.beanFactory.declareBean("encrypter", "theapp.security.StubEncrypter")
		application.beanFactory.declareBean("auditLog", "theapp.loggers.AuditLog", true, {
			logFile		= "theappAuditLog",
			encrypter	= application.beanFactory.getBean("encrypter")
		})
	}

}
