// Application.cfc
component {

	this.name				= "testApplicationStop";
	this.applicationTimeout	= createTimeSpan(0, 0, 1, 0);
	
	function onApplicationStart(){
		application.key			= createUuid();
		application.startedAt	= timeFormat(now(), "HH:MM:SS.LLL") & "<br />";
		application.firstVar	= "First var using #application.startedAt#";
		application.secondVar	= "Second using #application.startedAt#";
		
		param name="server.requestCount" default=0;
	}

	function onRequestStart(){
		request.requestId = ++server.requestCount;
		request.appKey		= application.key;			
		writeLog(file=this.name, text="Request #request.requestId# of #listLast(getBaseTemplatePath(), "\")# started at #formattedNow()# for application key: #application.key# (#request.appKey#)");
	}	

	function onRequestEnd(){
		writeLog(file=this.name, text="Request #request.requestId# of #listLast(getBaseTemplatePath(), "\")# ended at #formattedNow()# for application key: #application.key# (#request.appKey#)");
	}	
	
	function formattedNow(){
		return timeFormat(now(), "HH:MM:SS.LLL");
	}

}