component {
	this.name = "testAppStartUp3";
	
	public void function onApplicationStart(){
		sleep(5000);
		application.startTime = getTickCount();
	}
	
}