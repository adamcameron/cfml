component {

	this.name = "restDirTest01";

	public function onRequestStart(){
		writeLog(file=this.name, text="onRequestStart()");
	}

	public function onRequestEnd(){
		writeLog(file=this.name, text="onRequestEnd()");
	}

}