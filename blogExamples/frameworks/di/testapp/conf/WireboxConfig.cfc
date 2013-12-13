// WireBoxConfig.cfc
component extends="wirebox.system.ioc.config.Binder" {
	function configure() {
		/*
		wireBox = {
			scanLocations = ["model","myCFCs"]
		};*/
		map("AuditLog").to("testapp.loggers.AuditLog");
		map("TransactionLog").to("testapp.loggers.TransactionLog");
		map("UserService").to("testapp.users.UserService");
		map("UserDAO").to("testapp.users.MockedUserDAO");
		map("Encrypter").to("testapp.security.StubEncrypter");
	}
}