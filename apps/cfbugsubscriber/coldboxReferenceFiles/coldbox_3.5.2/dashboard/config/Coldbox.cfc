<cfcomponent output="false" hint="Dashboard Configuration">
<cfscript>
	
	// Configure ColdBox Application
	function configure(){
	
		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "ColdBox Dashboard",
			
			//Development Settings
			debugMode				= false,
			debugPassword			= "",
			reinitPassword			= "",
			handlersIndexAutoReload = false,
			
			//Implicit Events
			defaultEvent			= "main.dspFrameset",
			requestStartHandler		= "main.onRequestStart",
			requestEndHandler		= "",
			applicationStartHandler = "main.onAppStart",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",
			
			//Extension Points
			UDFLibraryFile 			= "includes/helpers/ApplicationHelper.cfm",
			coldboxExtensionsLocation = "",
			pluginsExternalLocation = "",
			viewsExternalLocation	= "",
			layoutsExternalLocation = "",
			handlersExternalLocation  = "",
			requestContextDecorator = "",
			
			//Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "main.dspFrameset",
			customErrorTemplate		= "",
				
			//Application Aspects
			handlerCaching 			= true,
			eventCaching			= true,
			proxyReturnCollection 	= false
		};
	
		// custom settings
		settings = {
			version = "2.4.0",
			trackerSite = "http://coldbox.assembla.com/",
			officialSite = "http://www.coldbox.org",
			coldbox_location = "/coldbox/system",
			adobeAdmin = "/CFIDE/administrator/login.cfm",
			blueDragonAdmin = "/bluedragon",
			railoAdmin = "/railo-context/admin/index.cfm"
		};
		
		//wirebox
		wirebox = { 
			enabled = true 
		};
		
		// environments
		environments = {
			development = "^cf8.,^railo.,^cf9."
		};
		
		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ColdboxTracerAppender" },
				fileAppender = {class="coldbox.system.logging.appenders.RollingFileAppender",
							    properties={filePath="logs", fileName="Dashboard"}
							    }
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};
		
		//Layout Settings
		layoutSettings = {
			defaultLayout = "Layout.simple.cfm"
		};
		
		//Register Layouts
		layouts = {
			login = {
				file = "Layout.Login.cfm",
				views = "vwLogin"
			},
			main = {
				file = "Layout.Main.cfm",
				views = "home/gateway,settings/gateway,bugs/gateway,tools/gateway,update/gateway"
			}
		};
		
		//Register interceptors as an array, we need order
		interceptors = [];
		

	}// end configure()
	
	function development(){
		coldbox.handlerCaching = false;
		coldbox.handlersIndexAutoReload = true;
		wirebox.singletonReload = true;
	}
	
</cfscript>
</cfcomponent>