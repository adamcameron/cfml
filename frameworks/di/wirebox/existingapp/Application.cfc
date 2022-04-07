// Application.cfc
component {
	this.name		= "wirebox_1"
	this.mappings	= {
		"/wirebox"	= expandPath("/shared/frameworks/wirebox/wirebox"),
		"/thesite"	= expandPath("."),
		"/theapp"	= expandPath("./me/adamcameron/theapp")
	}
	this.applicationTimeout = createTimespan(0,0,0,5)

	function onApplicationStart(){
		wirebox = new wirebox.system.ioc.Injector("thesite.WireboxBinder")
	}

}
