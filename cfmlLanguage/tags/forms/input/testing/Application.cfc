component {
	
	this.name				= "TN";
	this.datasource 		= "TN";
	this.sessionManagement	= true;
	this.clientManagement	= true;
	this.clientStorage		= "cookie";
	this.setClientCookies	= true;
	this.setDomainCookies	= false;

	this.mappings			= {
		"/com/tastingnotes"	= expandPath("/../com/tastingnotes"),
		"/coldspring"		= expandPath("/../org/coldspringframework/coldspring"),
		"/modelglue"		= expandPath("/../com/model-glue/ModelGlue")
	};

	this.ormenabled = true;
	this.ormsettings	= {
		dialect				= "MicrosoftSQLServer",
		savemapping			= false,
		dbcreate			= "update",	// dropcreate
		cfclocation	= [
			expandPath("/../com/tastingnotes/model/")
		]
	};

	public boolean function onApplicationStart(){
		application.bAppInited = false;
		initApp();
		return true;
	}

	/**
	@targetPage Path from the web root to the requested page
	*/
	public boolean function onRequestStart(string targetPage){
		if (structKeyExists(URL, "initApp") and isBoolean(URL.initApp) and URL.initApp){
			ormReload();
			applicationStop();
		}
		return true;
	}

	/**
	@output true
	@targetPage Path from the web root to the requested page
	*/
	public void function onRequest(string targetPage){
		// if the app is in the process of initialising, redirect to the busy page
		if (not application.bAppInited){
			include "/busy.cfm";
		}else{
			include arguments.targetPage;
		}
	}

	/**
	* @exception	A Java Exception object
	* @eventName	An event name
	*/
	public void function onError(any exception, string eventName){
		throw(object=arguments.exception);
	}


	/**
	* @hint Initialises the application
	*/
	public void function initApp(){
		application.oBeanFactory = createObject("component", "coldspring.beans.DefaultXmlBeanFactory").init();
		application.bAppInited = true;
	}

}
