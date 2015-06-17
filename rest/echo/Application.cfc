// Application.cfc
component {

	this.name = "restEchoTest03";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "components", "components");
	}
	
}