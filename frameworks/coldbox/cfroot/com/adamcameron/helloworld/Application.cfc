component {
	this.name				= "helloWorld"; 
	this.mappings			= {
		"/coldbox" = expandPath("/org/coldbox/coldbox_3.5.2")
	};
	
	COLDBOX_APP_ROOT_PATH	= getDirectoryFromPath(getCurrentTemplatePath());
	COLDBOX_APP_MAPPING		= "";
	COLDBOX_CONFIG_FILE		= "com.adamcameron.helloworld.conf.Coldbox";
	COLDBOX_APP_KEY 		= "";
	

	public boolean function onApplicationStart(){
		//Load ColdBox
		application.cbBootstrap = createObject("coldbox.system.Coldbox").init(COLDBOX_CONFIG_FILE,COLDBOX_APP_ROOT_PATH,COLDBOX_APP_KEY,COLDBOX_APP_MAPPING);
		application.cbBootstrap.loadColdbox();
		return true;
	}
	
	public boolean function onRequestStart(required String targetPage){
		// BootStrap Reinit Check 
		if (!structKeyExists(application,"cbBootstrap") || application.cbBootStrap.isfwReinit()){
			lock name="coldbox.bootstrap_#hash(getCurrentTemplatePath())#" type="exclusive" timeout="5" throwontimeout="true" {
				structDelete(application,"cbBootStrap");
				application.cbBootstrap = CreateObject("component","coldbox.system.Coldbox").init(COLDBOX_CONFIG_FILE,COLDBOX_APP_ROOT_PATH,COLDBOX_APP_KEY,COLDBOX_APP_MAPPING);
			}
		}
		// On Request Start via ColdBox 
		try {
		application.cbBootstrap.onRequestStart(arguments.targetPage);
		}
		catch (any e){
			writeDump(e);
			//abort;
		}
		
		return true;
	}
	
	public void function onApplicationEnd(required struct appScope){
		arguments.appScope.cbBootstrap.onApplicationEnd(argumentCollection=arguments);
	}
	
	public void function onSessionStart(){		
		application.cbBootstrap.onSessionStart();
	}
	
	public void function onSessionEnd(required stuct sessionScope, struct appScope){
		appScope.cbBootstrap.onSessionEnd(argumentCollection=arguments);
	}
	
	public boolean function onMissingTemplate(required string template){
		return application.cbBootstrap.onMissingTemplate(argumentCollection=arguments);
	}
	
}