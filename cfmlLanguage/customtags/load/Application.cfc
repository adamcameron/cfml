// Application.cfc
component {

	param URL.template;
	param URL.iterations=0;

	this.name				= "#URL.template#_#URL.iterations#_02";
	this.applicationTimeout	= createTimespan(0,0,0,30);

	function onApplicationStart(){
		application.runtime				= createObject("java","java.lang.Runtime").getRuntime();
		application.translationService	= new services.TranslationService();
		application.textUtilsService	= new services.TextUtilsService();
	}

	function onRequest(){
		var startTime		= getTickCount();
		include arguments[1];
		var executionTime	= getTickCount()-startTime;

		writeLog(file="#this.name#", text="#executionTime#;#getFreeAllocatedMemory()#");
	}

	function getFreeAllocatedMemory(){
		return int(application.runtime.freeMemory() / 1024^2);
	}

}