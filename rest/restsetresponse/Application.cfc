// Application.cfc
component {

	this.name = "restSetResponseTest58";
	this.webAdminPassword = "123456";
	
	public void function onApplicationStart(){
		restInitApplication(getDirectoryFromPath(getCurrentTemplatePath()) & "components", "components");
	}
	
}