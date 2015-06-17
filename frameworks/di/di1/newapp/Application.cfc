// Application.cfc
component {
	this.name		= "di1_1"
	this.mappings	= {
		"/di1"		= expandPath("/shared/frameworks/di1")
	}
	this.applicationTimeout = createTimespan(0,0,0,10)

	function onApplicationStart(){
		application.beanFactory = new di1.IOC(folders=expandPath("./api"))
	}

}
