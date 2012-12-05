component{
	
	public void function configure(){
		variables.coldbox = {
			appName					= application.applicationName,	// I'm not over the moon about this break of encapsulation, but equally I want to be as DRY as possible. I dunno why I need to specify this (again)
			appHomeUrl				= "http://#CGI.http_host##CGI.script_name#",
			defaultEvent			= "bug.main",

			// TODO: get rid once I understand what's going on
			HandlersIndexAutoReload	= true,
			handlerCaching			= false
		};
		variables.flash = {
			scope = "coldbox.system.web.flash.ColdboxCacheFlash"
		};
		
		variables.layoutSettings = {
			defaultLayout	= "html5.cfm",
			defaultView		= "main/default"
		};
		interceptors = [
			{
				class		= "coldbox.system.interceptors.Security",
				name		= "ApplicationSecurity",
				properties	= {
					rulesSource		= "xml",
					rulesFile		= "config/security.xml"
					
				}
			}
		];		
	}
}