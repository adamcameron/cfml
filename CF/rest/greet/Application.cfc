// Application.cfc
component {

	this.name = "restGreeterTest15";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "components", "components");
	}
	
}