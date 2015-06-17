component {

	function onRequestStart(){
		writeLog(file="cfcontentTest", text="onRequestStart() ran");
	}

	function onRequestEnd(){
		writeLog(file="cfcontentTest", text="onRequestEnd() ran");
	}

}