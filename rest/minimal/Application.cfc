component {
	this.name = "minimalRest18";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "api", "api");
	}
}