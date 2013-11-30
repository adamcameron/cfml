// Application.cfc
component {
	thisDir		= getDirectoryFromPath(getCurrentTemplatePath());
	sharedDir	= expandPath("/shared/");

	structAppend(this, {
		name		= "testDI11",
		applicationTimeout	= createTimespan(0,0,0,30),
		mappings	= {
			"/testapp"		= thisDir,
			"/wirebox"		= sharedDir & "wirebox",
			"/coldspring"	= sharedDir & "coldspring1-2-final"
		}
	});

	public void function onApplicationStart(){
		wirebox = new wirebox.system.ioc.Injector("testapp.conf.WireboxConfig");
		application.coldspringBeanFactory = new coldspring.beans.DefaultXmlBeanFactory(getApplicationConfig());
		application.coldspringBeanFactory.loadBeansFromXmlFile("../conf/coldspringConfig.xml", true);
	}

	private struct function getApplicationConfig(){
		return {
			userDsn = "userDsn",
			transactionLogFile	= "transactionLog",
			auditLogFile	= "auditLog"
		};
	}

}