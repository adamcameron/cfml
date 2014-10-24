// Application.cfc
component {
	this.name		= "wirebox_18"
	this.mappings	= {
		"/wirebox"	= expandPath("/shared/frameworks/wirebox/wirebox"),
		"/api"		= expandPath("./api")
	}
	this.applicationTimeout = createTimespan(0,0,0,10)

	function onApplicationStart(){
		wirebox = new wirebox.system.ioc.Injector()
	}

}
