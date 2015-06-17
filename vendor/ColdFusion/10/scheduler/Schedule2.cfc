component implements="CFIDE.scheduler.ITaskEventHandler" {
	remote void function execute(){
		writeLog(file="schedule2_1", text="execute() called");
	}
}