component {
	this.name = "testAppStartUp1";
	
	public void function onApplicationStart(){
		sleep(10000);
		application.startTime = getTickCount();
	}
	
}