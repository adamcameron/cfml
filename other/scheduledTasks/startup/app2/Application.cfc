component {
	this.name = "testAppStartUp2";
	
	public void function onApplicationStart(){
		sleep(2000);
		application.startTime = getTickCount();
	}
	
}