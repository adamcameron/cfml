component {

	this.name				= "cfAdminApiTesting4";
	this.sessionManagement	= true;

	public void function onApplicationStart(){
		application.oApiAdmin			= createObject("component", "CFIDE.adminapi.administrator");
		application.oApiRuntime			= createObject("component", "CFIDE.adminapi.runtime");
		application.oApiExtensions		= createObject("component", "CFIDE.adminapi.extensions");
		application.oApiMail			= createObject("component", "CFIDE.adminapi.mail");
		application.oApiDebugging		= createObject("component", "CFIDE.adminapi.debugging");
		application.oApiDatasource		= createObject("component", "CFIDE.adminapi.datasource");
		application.oApiFlex			= createObject("component", "CFIDE.adminapi.flex");
		application.oApiEventGateway	= createObject("component", "CFIDE.adminapi.eventgateway");
		application.oApiSecurity		= createObject("component", "CFIDE.adminapi.security");
	}

	public void function onSessionStart(){
		application.oApiAdmin.login("123");
	}

	public void function onRequestStart(){
		writeOutput("Logged in OK: [#application.oApiAdmin.isAdminUser()#]<br />");
		include "./udf.cfm";
	}
	
}