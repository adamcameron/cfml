component implements="CFIDE.scheduler.ITaskEventHandler" {

	public void function execute(){
		writeLog(file="schedule1_5", text="execute() called");
	}
	
	public void function onError(struct context){
		writeLog(file="schedule1_5", text="onError() called");
	}
	
	public void function onMisfire(struct context){
		writeLog(file="schedule1_5", text="onMisfire() called");
	}
	
	public void function onTaskEnd(struct context){
		writeLog(file="schedule1_5", text="onTaskEnd() called");
	}
	
	public boolean function onTaskStart(struct context){
		writeLog(file="schedule1_5", text="onTaskStart() called");
		return true;
	}

}