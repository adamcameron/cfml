// Application.cfc
component {

	this.name = "arrayIssue03";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "components", "components");
	}
	
}