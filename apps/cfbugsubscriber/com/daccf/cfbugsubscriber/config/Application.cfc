component {

	variables.thisDir		= getDirectoryFromPath(getCurrentTemplatePath());

	this.name				= "cfBugSubscriber2";
	this.setDomainCookies	= true;
	this.sessionManagement	= true;
	this.loginStorage		= "session";
	this.mappings			= {
		"/"			= variables.thisDir,
		"/coldbox"	= expandPath("/org/coldbox/coldbox_3.5.2")
	};

	this.datasource			= "cfBugSubscriber";
	this.ormEnabled			= true;
	this.ormSettings		= {
		dbCreate		= "update",
		//dialect			= "Derby",
		dialect			= "MySQL",
		logSQL			= true,
		eventhandling	= true,
		cfclocation		= expandPath("/com/daccf/cfbugsubscriber/orm")
	};

	
	// reqd COLDBOX settings
	COLDBOX_APP_ROOT_PATH	= variables.thisDir;	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_MAPPING		= "";	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_CONFIG_FILE		= "";	//COLDBOX PROPERTIES
	COLDBOX_APP_KEY			= "";	//COLDBOX APPLICATION KEY OVERRIDE
	
	public boolean function onApplicationStart(){
		//Load ColdBox
		application.cbBootstrap = createObject("coldbox.system.Coldbox").init(COLDBOX_CONFIG_FILE,COLDBOX_APP_ROOT_PATH,COLDBOX_APP_KEY,COLDBOX_APP_MAPPING);
		application.cbBootstrap.loadColdbox();
		return true;
	}

	public boolean function onRequestStart(required string targetPage){
		application.cbBootstrap.onRequestStart(arguments.targetPage);
		return true;
	}

}