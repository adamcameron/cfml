// NestedViaComponent.cfc

component {
	function doAThread(){
		writeLog(file="nestedViaComponent01", text="Top of doAThread() in NestedViaComponent.cfc");
		thread name="t2" action="run" {
			sleep(1000);
			writeLog(file="nestedViaComponent01", text="Bottom of t2");
		}
		writeLog(file="nestedViaComponent01", text="Bottom of doAThread() in NestedViaComponent.cfc");
	}
}