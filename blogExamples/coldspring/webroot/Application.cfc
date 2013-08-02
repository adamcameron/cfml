// Application.cfc
component {

	this.name = "coldspringTest02";
	this.mappings = {
		"/coldspring" = expandPath("../coldspring"),
		"/api" = expandPath("../api")
	};

	public void function onApplicationStart(){

		application.environmentConfig = deserializeJson(fileread(expandPath("../conf/environment-config.json")));

		if (application.environmentConfig.coldspringLoadMode == "APPLICATION"){
			initColdspring();
		}

		writeOutput("Application initialised @ #timeFormat(now(), "HH:MM:SS.LLL")#<br>");
	}

	public void function onRequestStart(){
		if (application.environmentConfig.coldspringLoadMode == "REQUEST"){
			initColdspring();
		}
	}


	private void function initColdspring(){
		var properties = initColdspringProperties();

		application.beanFactory = createObject("coldspring.beans.DefaultXmlBeanFactory").init(defaultProperties=properties);
		application.beanFactory.loadBeansFromXmlFile("../conf/beans.xml", true);
		writeOutput("Coldspring initialised @ #timeFormat(now(), "HH:MM:SS.LLL")#<br>");
	}

	private struct function initColdspringProperties(){
		return {timestamp=now()};

	}

}